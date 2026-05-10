; DESCRIPTION: Draws a orange line from (378, 112) to (258, 242).
; PLAN: r0=378(x1), r1=112(y1), r2=258(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 112
LDI r2, 258
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
