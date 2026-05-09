; DESCRIPTION: Draws a white line from (274, 128) to (184, 176).
; PLAN: r0=274(x1), r1=128(y1), r2=184(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 128
LDI r2, 184
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
