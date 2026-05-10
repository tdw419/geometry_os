; DESCRIPTION: Draws a white line from (276, 214) to (98, 158).
; PLAN: r0=276(x1), r1=214(y1), r2=98(x2), r3=158(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 214
LDI r2, 98
LDI r3, 158
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
