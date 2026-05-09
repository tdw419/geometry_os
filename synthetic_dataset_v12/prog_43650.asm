; DESCRIPTION: Composite: Sets a single blue pixel at (501, 25) then Places a yellow line segment connecting (170, 204) to (149, 84).
; PLAN: r0=501(x), r1=25(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=170(x1), r6=204(y1), r7=149(x2), r8=84(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 501
LDI r1, 25
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 170
LDI r6, 204
LDI r7, 149
LDI r8, 84
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
