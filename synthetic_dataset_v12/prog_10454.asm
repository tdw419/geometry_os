; DESCRIPTION: Renders a green line between points (5, 19) and (496, 182).
; PLAN: r0=5(x1), r1=19(y1), r2=496(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 19
LDI r2, 496
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
