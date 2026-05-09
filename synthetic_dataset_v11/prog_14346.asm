; DESCRIPTION: Renders a blue line between points (70, 42) and (229, 52).
; PLAN: r0=70(x1), r1=42(y1), r2=229(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 42
LDI r2, 229
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
