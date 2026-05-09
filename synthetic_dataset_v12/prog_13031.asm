; DESCRIPTION: Renders a blue line between points (98, 117) and (358, 236).
; PLAN: r0=98(x1), r1=117(y1), r2=358(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 117
LDI r2, 358
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
