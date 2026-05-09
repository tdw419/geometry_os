; DESCRIPTION: Renders a red line between points (27, 43) and (128, 123).
; PLAN: r0=27(x1), r1=43(y1), r2=128(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 43
LDI r2, 128
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
