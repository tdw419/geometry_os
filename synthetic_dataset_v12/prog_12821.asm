; DESCRIPTION: Renders a white line between points (214, 166) and (156, 23).
; PLAN: r0=214(x1), r1=166(y1), r2=156(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 166
LDI r2, 156
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
