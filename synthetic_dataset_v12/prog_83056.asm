; DESCRIPTION: Renders a orange line between points (498, 222) and (18, 108).
; PLAN: r0=498(x1), r1=222(y1), r2=18(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 222
LDI r2, 18
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
