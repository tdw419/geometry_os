; DESCRIPTION: Renders a magenta line between points (210, 157) and (81, 30).
; PLAN: r0=210(x1), r1=157(y1), r2=81(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 157
LDI r2, 81
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
