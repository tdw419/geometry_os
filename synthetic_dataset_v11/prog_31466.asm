; DESCRIPTION: Draws a green line from (79, 109) to (43, 6).
; PLAN: r0=79(x1), r1=109(y1), r2=43(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 109
LDI r2, 43
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
