; DESCRIPTION: Draws a white line from (87, 246) to (5, 244).
; PLAN: r0=87(x1), r1=246(y1), r2=5(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 246
LDI r2, 5
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
