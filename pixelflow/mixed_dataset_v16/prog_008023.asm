; DESCRIPTION: Composite: Draws a yellow circle centered at (421, 146) with radius 65 then Places a yellow line segment connecting (23, 6) to (33, 191) then Places a blue dot at position (207, 252).
; PLAN: r0=421(x), r1=146(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=23(x1), r6=6(y1), r7=33(x2), r8=191(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=207(x), r11=252(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 421
LDI r1, 146
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 23
LDI r6, 6
LDI r7, 33
LDI r8, 191
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 252
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
