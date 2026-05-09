; DESCRIPTION: Renders a yellow line between points (487, 153) and (394, 17).
; PLAN: r0=487(x1), r1=153(y1), r2=394(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 153
LDI r2, 394
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
