; DESCRIPTION: Places a yellow line segment connecting (298, 2) to (126, 149).
; PLAN: r0=298(x1), r1=2(y1), r2=126(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 2
LDI r2, 126
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
