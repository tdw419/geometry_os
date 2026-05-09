; DESCRIPTION: Draws a green line from (48, 207) to (211, 176).
; PLAN: r0=48(x1), r1=207(y1), r2=211(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 207
LDI r2, 211
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
