; DESCRIPTION: Renders a red line between points (245, 220) and (262, 9).
; PLAN: r0=245(x1), r1=220(y1), r2=262(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 220
LDI r2, 262
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
