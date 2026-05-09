; DESCRIPTION: Renders a yellow line between points (280, 191) and (158, 166).
; PLAN: r0=280(x1), r1=191(y1), r2=158(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 191
LDI r2, 158
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
