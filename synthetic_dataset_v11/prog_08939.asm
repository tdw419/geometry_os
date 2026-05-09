; DESCRIPTION: Places a white line segment connecting (60, 185) to (73, 103).
; PLAN: r0=60(x1), r1=185(y1), r2=73(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 185
LDI r2, 73
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
