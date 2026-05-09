; DESCRIPTION: Composite: Renders a orange box of size 67x106 starting at (2, 50) then Places a white circle of radius 34 at center (333, 112) then Places a blue dot at position (223, 220).
; PLAN: r0=2(x), r1=50(y), r2=67(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x), r6=112(y), r7=34(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=223(x), r11=220(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 2
LDI r1, 50
LDI r2, 67
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 112
LDI r7, 34
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 223
LDI r11, 220
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
