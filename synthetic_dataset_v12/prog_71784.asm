; DESCRIPTION: Draws a green line from (232, 246) to (502, 4).
; PLAN: r0=232(x1), r1=246(y1), r2=502(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 246
LDI r2, 502
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
