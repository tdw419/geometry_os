; DESCRIPTION: Renders a white line between points (176, 166) and (72, 129).
; PLAN: r0=176(x1), r1=166(y1), r2=72(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 166
LDI r2, 72
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
