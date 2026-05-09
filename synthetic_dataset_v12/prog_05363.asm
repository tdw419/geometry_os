; DESCRIPTION: Draws a green line from (364, 173) to (129, 194).
; PLAN: r0=364(x1), r1=173(y1), r2=129(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 173
LDI r2, 129
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
