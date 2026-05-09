; DESCRIPTION: Draws a orange line from (199, 166) to (26, 192).
; PLAN: r0=199(x1), r1=166(y1), r2=26(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 166
LDI r2, 26
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
