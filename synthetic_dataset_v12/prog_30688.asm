; DESCRIPTION: Renders a white line between points (396, 43) and (166, 99).
; PLAN: r0=396(x1), r1=43(y1), r2=166(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 43
LDI r2, 166
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
