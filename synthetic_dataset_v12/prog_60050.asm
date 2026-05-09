; DESCRIPTION: Renders a yellow line between points (487, 81) and (15, 19).
; PLAN: r0=487(x1), r1=81(y1), r2=15(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 81
LDI r2, 15
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
