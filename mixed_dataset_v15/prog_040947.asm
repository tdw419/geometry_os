; DESCRIPTION: Composite: Creates a orange circular shape at (357, 33) with radius 18 then Places a blue line segment connecting (100, 28) to (149, 222) then Sets a single cyan pixel at (382, 69).
; PLAN: r0=357(x), r1=33(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=100(x1), r6=28(y1), r7=149(x2), r8=222(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=382(x), r11=69(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 357
LDI r1, 33
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 100
LDI r6, 28
LDI r7, 149
LDI r8, 222
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 382
LDI r11, 69
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
