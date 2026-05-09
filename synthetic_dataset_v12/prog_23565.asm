; DESCRIPTION: Renders a orange line between points (289, 195) and (446, 92).
; PLAN: r0=289(x1), r1=195(y1), r2=446(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 195
LDI r2, 446
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
