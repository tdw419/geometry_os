; DESCRIPTION: Renders a red line between points (75, 194) and (492, 32).
; PLAN: r0=75(x1), r1=194(y1), r2=492(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 194
LDI r2, 492
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
