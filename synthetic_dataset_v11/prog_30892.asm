; DESCRIPTION: Renders a black line between points (30, 108) and (102, 239).
; PLAN: r0=30(x1), r1=108(y1), r2=102(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 108
LDI r2, 102
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
