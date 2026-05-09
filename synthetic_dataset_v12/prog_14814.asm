; DESCRIPTION: Renders a magenta line between points (291, 168) and (157, 86).
; PLAN: r0=291(x1), r1=168(y1), r2=157(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 168
LDI r2, 157
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
