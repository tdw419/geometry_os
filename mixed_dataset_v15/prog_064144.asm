; DESCRIPTION: Draws a white line from (402, 62) to (157, 30).
; PLAN: r0=402(x1), r1=62(y1), r2=157(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 62
LDI r2, 157
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
