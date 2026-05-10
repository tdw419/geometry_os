; DESCRIPTION: Draws a green line from (107, 14) to (343, 120).
; PLAN: r0=107(x1), r1=14(y1), r2=343(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 14
LDI r2, 343
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
