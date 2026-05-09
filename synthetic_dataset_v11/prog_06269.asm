; DESCRIPTION: Draws a white line from (195, 26) to (26, 151).
; PLAN: r0=195(x1), r1=26(y1), r2=26(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 26
LDI r2, 26
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
