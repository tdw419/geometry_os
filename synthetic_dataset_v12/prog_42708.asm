; DESCRIPTION: Draws a cyan line from (276, 155) to (261, 11).
; PLAN: r0=276(x1), r1=155(y1), r2=261(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 155
LDI r2, 261
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
