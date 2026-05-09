; DESCRIPTION: Renders a yellow line between points (329, 169) and (18, 27).
; PLAN: r0=329(x1), r1=169(y1), r2=18(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 169
LDI r2, 18
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
