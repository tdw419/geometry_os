; DESCRIPTION: Draws a green line from (372, 192) to (283, 212).
; PLAN: r0=372(x1), r1=192(y1), r2=283(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 192
LDI r2, 283
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
