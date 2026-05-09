; DESCRIPTION: Draws a green line from (358, 122) to (365, 248).
; PLAN: r0=358(x1), r1=122(y1), r2=365(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 122
LDI r2, 365
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
