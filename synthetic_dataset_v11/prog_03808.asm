; DESCRIPTION: Draws a blue line from (167, 137) to (205, 138).
; PLAN: r0=167(x1), r1=137(y1), r2=205(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 137
LDI r2, 205
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
