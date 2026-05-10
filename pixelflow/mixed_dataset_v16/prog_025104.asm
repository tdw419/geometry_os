; DESCRIPTION: Renders a orange line between points (273, 154) and (469, 253).
; PLAN: r0=273(x1), r1=154(y1), r2=469(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 154
LDI r2, 469
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
