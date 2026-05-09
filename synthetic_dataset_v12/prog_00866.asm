; DESCRIPTION: Draws a green line from (276, 12) to (286, 133).
; PLAN: r0=276(x1), r1=12(y1), r2=286(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 12
LDI r2, 286
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
