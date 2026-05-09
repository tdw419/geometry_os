; DESCRIPTION: Renders a magenta line between points (225, 240) and (135, 82).
; PLAN: r0=225(x1), r1=240(y1), r2=135(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 240
LDI r2, 135
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
