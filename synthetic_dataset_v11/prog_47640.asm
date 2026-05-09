; DESCRIPTION: Renders a black line between points (247, 234) and (184, 39).
; PLAN: r0=247(x1), r1=234(y1), r2=184(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 234
LDI r2, 184
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
