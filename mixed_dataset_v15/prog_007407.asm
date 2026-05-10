; DESCRIPTION: Renders a white line between points (131, 151) and (189, 159).
; PLAN: r0=131(x1), r1=151(y1), r2=189(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 151
LDI r2, 189
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
