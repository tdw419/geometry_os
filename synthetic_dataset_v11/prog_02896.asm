; DESCRIPTION: Draws a blue line from (98, 126) to (143, 158).
; PLAN: r0=98(x1), r1=126(y1), r2=143(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 126
LDI r2, 143
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
