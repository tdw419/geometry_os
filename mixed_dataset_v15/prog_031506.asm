; DESCRIPTION: Renders a red line between points (128, 101) and (285, 46).
; PLAN: r0=128(x1), r1=101(y1), r2=285(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 101
LDI r2, 285
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
