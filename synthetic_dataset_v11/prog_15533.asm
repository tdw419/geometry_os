; DESCRIPTION: Renders a blue line between points (113, 55) and (212, 128).
; PLAN: r0=113(x1), r1=55(y1), r2=212(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 55
LDI r2, 212
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
