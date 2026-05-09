; DESCRIPTION: Places a white line segment connecting (38, 74) to (307, 145).
; PLAN: r0=38(x1), r1=74(y1), r2=307(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 74
LDI r2, 307
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
