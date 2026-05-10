; DESCRIPTION: Renders a white line between points (197, 226) and (506, 0).
; PLAN: r0=197(x1), r1=226(y1), r2=506(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 226
LDI r2, 506
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
