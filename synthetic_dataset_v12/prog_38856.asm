; DESCRIPTION: Composite: Places a orange line segment connecting (216, 84) to (19, 33) then Places a cyan circle of radius 27 at center (196, 78).
; PLAN: r0=216(x1), r1=84(y1), r2=19(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=78(y), r7=27(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 216
LDI r1, 84
LDI r2, 19
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 78
LDI r7, 27
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
