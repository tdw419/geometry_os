; DESCRIPTION: Renders a red line between points (9, 59) and (95, 125).
; PLAN: r0=9(x1), r1=59(y1), r2=95(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 59
LDI r2, 95
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
