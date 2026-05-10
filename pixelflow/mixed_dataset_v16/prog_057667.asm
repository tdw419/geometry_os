; DESCRIPTION: Renders a black line between points (394, 19) and (176, 183).
; PLAN: r0=394(x1), r1=19(y1), r2=176(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 19
LDI r2, 176
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
