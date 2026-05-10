; DESCRIPTION: Places a white line segment connecting (180, 21) to (246, 23).
; PLAN: r0=180(x1), r1=21(y1), r2=246(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 21
LDI r2, 246
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
