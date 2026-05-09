; DESCRIPTION: Renders a white line between points (197, 55) and (265, 48).
; PLAN: r0=197(x1), r1=55(y1), r2=265(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 55
LDI r2, 265
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
