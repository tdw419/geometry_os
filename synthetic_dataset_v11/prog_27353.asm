; DESCRIPTION: Renders a red line between points (87, 37) and (216, 113).
; PLAN: r0=87(x1), r1=37(y1), r2=216(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 37
LDI r2, 216
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
