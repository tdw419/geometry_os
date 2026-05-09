; DESCRIPTION: Renders a white line between points (130, 159) and (131, 209).
; PLAN: r0=130(x1), r1=159(y1), r2=131(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 159
LDI r2, 131
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
