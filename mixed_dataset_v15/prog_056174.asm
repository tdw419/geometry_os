; DESCRIPTION: Draws a white line from (437, 176) to (414, 232).
; PLAN: r0=437(x1), r1=176(y1), r2=414(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 176
LDI r2, 414
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
