; DESCRIPTION: Draws a green line from (129, 107) to (426, 176).
; PLAN: r0=129(x1), r1=107(y1), r2=426(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 107
LDI r2, 426
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
