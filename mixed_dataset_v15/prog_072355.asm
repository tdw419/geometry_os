; DESCRIPTION: Draws a green line from (211, 227) to (445, 227).
; PLAN: r0=211(x1), r1=227(y1), r2=445(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 227
LDI r2, 445
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
