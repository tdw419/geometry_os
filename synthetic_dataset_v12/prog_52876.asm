; DESCRIPTION: Composite: Sets a single magenta pixel at (75, 186) then Places a white circle of radius 13 at center (88, 86) then Renders a orange box of size 104x97 starting at (118, 28).
; PLAN: r0=75(x), r1=186(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=88(x), r6=86(y), r7=13(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=118(x), r11=28(y), r12=104(width), r13=97(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 186
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 88
LDI r6, 86
LDI r7, 13
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 118
LDI r11, 28
LDI r12, 104
LDI r13, 97
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
