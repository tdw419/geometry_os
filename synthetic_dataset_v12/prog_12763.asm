; DESCRIPTION: Renders a blue line between points (168, 52) and (450, 215).
; PLAN: r0=168(x1), r1=52(y1), r2=450(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 52
LDI r2, 450
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
