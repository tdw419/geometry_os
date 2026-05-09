; DESCRIPTION: Renders a orange line between points (108, 189) and (286, 173).
; PLAN: r0=108(x1), r1=189(y1), r2=286(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 189
LDI r2, 286
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
