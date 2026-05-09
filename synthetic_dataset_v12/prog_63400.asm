; DESCRIPTION: Renders a blue line between points (42, 65) and (491, 82).
; PLAN: r0=42(x1), r1=65(y1), r2=491(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 65
LDI r2, 491
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
