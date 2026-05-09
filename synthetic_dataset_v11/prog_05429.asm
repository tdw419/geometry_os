; DESCRIPTION: Draws a green line from (155, 249) to (107, 176).
; PLAN: r0=155(x1), r1=249(y1), r2=107(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 249
LDI r2, 107
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
