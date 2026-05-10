; DESCRIPTION: Renders a red line segment connecting (296, 149) to (61, 125).
; PLAN: r0=296(x1), r1=149(y1), r2=61(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 149
LDI r2, 61
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
