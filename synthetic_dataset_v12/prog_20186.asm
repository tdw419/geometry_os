; DESCRIPTION: Renders a red line between points (84, 150) and (184, 16).
; PLAN: r0=84(x1), r1=150(y1), r2=184(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 150
LDI r2, 184
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
