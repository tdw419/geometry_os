; DESCRIPTION: Draws a green line from (358, 174) to (327, 194).
; PLAN: r0=358(x1), r1=174(y1), r2=327(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 174
LDI r2, 327
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
