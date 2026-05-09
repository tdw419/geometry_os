; DESCRIPTION: Renders a green line between points (166, 173) and (232, 93).
; PLAN: r0=166(x1), r1=173(y1), r2=232(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 173
LDI r2, 232
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
