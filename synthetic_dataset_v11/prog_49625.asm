; DESCRIPTION: Renders a blue line between points (50, 29) and (228, 165).
; PLAN: r0=50(x1), r1=29(y1), r2=228(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 29
LDI r2, 228
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
