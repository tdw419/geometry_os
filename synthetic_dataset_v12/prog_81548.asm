; DESCRIPTION: Places a white line segment connecting (307, 122) to (424, 87).
; PLAN: r0=307(x1), r1=122(y1), r2=424(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 122
LDI r2, 424
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
