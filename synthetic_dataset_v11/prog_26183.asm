; DESCRIPTION: Renders a green line between points (101, 166) and (214, 89).
; PLAN: r0=101(x1), r1=166(y1), r2=214(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 166
LDI r2, 214
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
