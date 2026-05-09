; DESCRIPTION: Renders a white line between points (421, 36) and (402, 143).
; PLAN: r0=421(x1), r1=36(y1), r2=402(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 36
LDI r2, 402
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
