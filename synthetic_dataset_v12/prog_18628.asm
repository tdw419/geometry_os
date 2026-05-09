; DESCRIPTION: Renders a red line between points (122, 226) and (40, 113).
; PLAN: r0=122(x1), r1=226(y1), r2=40(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 226
LDI r2, 40
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
