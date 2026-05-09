; DESCRIPTION: Renders a orange line between points (202, 126) and (58, 12).
; PLAN: r0=202(x1), r1=126(y1), r2=58(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 126
LDI r2, 58
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
