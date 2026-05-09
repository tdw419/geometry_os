; DESCRIPTION: Renders a blue line between points (42, 21) and (193, 124).
; PLAN: r0=42(x1), r1=21(y1), r2=193(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 21
LDI r2, 193
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
