; DESCRIPTION: Draws a green line from (364, 172) to (18, 169).
; PLAN: r0=364(x1), r1=172(y1), r2=18(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 172
LDI r2, 18
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
