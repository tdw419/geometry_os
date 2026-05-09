; DESCRIPTION: Renders a blue line between points (113, 41) and (450, 40).
; PLAN: r0=113(x1), r1=41(y1), r2=450(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 41
LDI r2, 450
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
