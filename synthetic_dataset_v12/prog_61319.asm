; DESCRIPTION: Renders a magenta line between points (383, 168) and (12, 137).
; PLAN: r0=383(x1), r1=168(y1), r2=12(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 168
LDI r2, 12
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
