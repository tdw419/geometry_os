; DESCRIPTION: Draws a black line from (351, 126) to (168, 157).
; PLAN: r0=351(x1), r1=126(y1), r2=168(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 126
LDI r2, 168
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
