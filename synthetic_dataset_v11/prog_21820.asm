; DESCRIPTION: Renders a magenta line between points (82, 135) and (70, 250).
; PLAN: r0=82(x1), r1=135(y1), r2=70(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 135
LDI r2, 70
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
