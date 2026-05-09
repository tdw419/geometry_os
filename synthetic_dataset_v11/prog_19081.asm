; DESCRIPTION: Renders a red line between points (75, 173) and (176, 84).
; PLAN: r0=75(x1), r1=173(y1), r2=176(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 173
LDI r2, 176
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
