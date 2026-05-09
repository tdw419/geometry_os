; DESCRIPTION: Renders a green line between points (108, 182) and (254, 51).
; PLAN: r0=108(x1), r1=182(y1), r2=254(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 182
LDI r2, 254
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
