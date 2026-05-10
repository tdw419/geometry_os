; DESCRIPTION: Places a purple line segment connecting (326, 221) to (470, 141).
; PLAN: r0=326(x1), r1=221(y1), r2=470(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 221
LDI r2, 470
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
