; DESCRIPTION: Renders a magenta line between points (143, 188) and (295, 90).
; PLAN: r0=143(x1), r1=188(y1), r2=295(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 188
LDI r2, 295
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
