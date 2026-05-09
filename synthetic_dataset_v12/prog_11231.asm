; DESCRIPTION: Renders a white line between points (61, 4) and (48, 194).
; PLAN: r0=61(x1), r1=4(y1), r2=48(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 4
LDI r2, 48
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
