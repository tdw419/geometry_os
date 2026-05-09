; DESCRIPTION: Draws a blue line from (261, 82) to (229, 195).
; PLAN: r0=261(x1), r1=82(y1), r2=229(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 82
LDI r2, 229
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
