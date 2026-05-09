; DESCRIPTION: Renders a green line between points (101, 178) and (117, 109).
; PLAN: r0=101(x1), r1=178(y1), r2=117(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 178
LDI r2, 117
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
