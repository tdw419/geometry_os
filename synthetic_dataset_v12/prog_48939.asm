; DESCRIPTION: Places a purple line segment connecting (103, 80) to (446, 16).
; PLAN: r0=103(x1), r1=80(y1), r2=446(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 80
LDI r2, 446
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
