; DESCRIPTION: Renders a magenta line between points (240, 68) and (481, 49).
; PLAN: r0=240(x1), r1=68(y1), r2=481(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 68
LDI r2, 481
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
