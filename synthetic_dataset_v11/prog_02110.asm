; DESCRIPTION: Draws a green line from (36, 163) to (246, 161).
; PLAN: r0=36(x1), r1=163(y1), r2=246(x2), r3=161(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 163
LDI r2, 246
LDI r3, 161
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
