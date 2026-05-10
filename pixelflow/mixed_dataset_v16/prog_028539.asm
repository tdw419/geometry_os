; DESCRIPTION: Draws a blue line from (98, 81) to (276, 128).
; PLAN: r0=98(x1), r1=81(y1), r2=276(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 81
LDI r2, 276
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
