; DESCRIPTION: Renders a magenta line between points (59, 73) and (193, 36).
; PLAN: r0=59(x1), r1=73(y1), r2=193(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 73
LDI r2, 193
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
