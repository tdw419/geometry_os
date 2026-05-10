; DESCRIPTION: Draws a white line from (183, 128) to (50, 136).
; PLAN: r0=183(x1), r1=128(y1), r2=50(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 128
LDI r2, 50
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
