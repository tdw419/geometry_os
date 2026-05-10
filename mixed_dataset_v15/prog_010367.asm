; DESCRIPTION: Composite: Draws a green circle centered at (430, 217) with radius 16 then Renders a green box of size 103x23 starting at (1, 152).
; PLAN: r0=430(x), r1=217(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=1(x), r6=152(y), r7=103(width), r8=23(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 430
LDI r1, 217
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 1
LDI r6, 152
LDI r7, 103
LDI r8, 23
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
