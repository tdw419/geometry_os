; DESCRIPTION: Composite: Draws a cyan circle centered at (101, 43) with radius 42 then Places a blue line segment connecting (20, 110) to (23, 46).
; PLAN: r0=101(x), r1=43(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x1), r6=110(y1), r7=23(x2), r8=46(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 43
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 110
LDI r7, 23
LDI r8, 46
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
