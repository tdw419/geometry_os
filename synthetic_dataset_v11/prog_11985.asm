; DESCRIPTION: Renders a black line between points (113, 75) and (61, 57).
; PLAN: r0=113(x1), r1=75(y1), r2=61(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 75
LDI r2, 61
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
