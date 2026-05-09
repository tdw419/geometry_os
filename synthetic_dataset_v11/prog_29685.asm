; DESCRIPTION: Renders a red line between points (61, 27) and (20, 142).
; PLAN: r0=61(x1), r1=27(y1), r2=20(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 27
LDI r2, 20
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
