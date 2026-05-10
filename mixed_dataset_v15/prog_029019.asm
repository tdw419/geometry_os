; DESCRIPTION: Renders a orange line between points (103, 173) and (95, 144).
; PLAN: r0=103(x1), r1=173(y1), r2=95(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 173
LDI r2, 95
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
