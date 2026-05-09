; DESCRIPTION: Renders a black line between points (259, 154) and (375, 249).
; PLAN: r0=259(x1), r1=154(y1), r2=375(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 154
LDI r2, 375
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
