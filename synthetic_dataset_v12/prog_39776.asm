; DESCRIPTION: Draws a green line from (181, 222) to (335, 138).
; PLAN: r0=181(x1), r1=222(y1), r2=335(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 222
LDI r2, 335
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
