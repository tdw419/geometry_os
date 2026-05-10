; DESCRIPTION: Places a white line segment connecting (385, 179) to (446, 67).
; PLAN: r0=385(x1), r1=179(y1), r2=446(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 179
LDI r2, 446
LDI r3, 67
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
