; DESCRIPTION: Renders a red line between points (50, 166) and (75, 21).
; PLAN: r0=50(x1), r1=166(y1), r2=75(x2), r3=21(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 166
LDI r2, 75
LDI r3, 21
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
