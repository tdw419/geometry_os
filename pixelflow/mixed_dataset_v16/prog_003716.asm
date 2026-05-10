; DESCRIPTION: Places a purple line segment connecting (338, 204) to (295, 238).
; PLAN: r0=338(x1), r1=204(y1), r2=295(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 204
LDI r2, 295
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
