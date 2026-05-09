; DESCRIPTION: Renders a white line between points (131, 126) and (125, 204).
; PLAN: r0=131(x1), r1=126(y1), r2=125(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 126
LDI r2, 125
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
