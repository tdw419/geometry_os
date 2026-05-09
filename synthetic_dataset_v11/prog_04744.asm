; DESCRIPTION: Places a green line segment connecting (251, 67) to (106, 83).
; PLAN: r0=251(x1), r1=67(y1), r2=106(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 67
LDI r2, 106
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
