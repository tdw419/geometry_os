; DESCRIPTION: Places a white line segment connecting (26, 213) to (36, 82).
; PLAN: r0=26(x1), r1=213(y1), r2=36(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 213
LDI r2, 36
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
