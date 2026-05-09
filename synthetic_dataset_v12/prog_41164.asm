; DESCRIPTION: Draws a black line from (373, 8) to (8, 167).
; PLAN: r0=373(x1), r1=8(y1), r2=8(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 8
LDI r2, 8
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
