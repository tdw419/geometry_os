; DESCRIPTION: Renders a green line between points (124, 249) and (167, 163).
; PLAN: r0=124(x1), r1=249(y1), r2=167(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 249
LDI r2, 167
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
