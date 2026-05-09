; DESCRIPTION: Draws a green line from (205, 237) to (158, 82).
; PLAN: r0=205(x1), r1=237(y1), r2=158(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 237
LDI r2, 158
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
