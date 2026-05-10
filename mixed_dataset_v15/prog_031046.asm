; DESCRIPTION: Draws a white line from (282, 96) to (252, 163).
; PLAN: r0=282(x1), r1=96(y1), r2=252(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 96
LDI r2, 252
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
