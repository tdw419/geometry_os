; DESCRIPTION: Renders a white line between points (123, 163) and (279, 167).
; PLAN: r0=123(x1), r1=163(y1), r2=279(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 163
LDI r2, 279
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
