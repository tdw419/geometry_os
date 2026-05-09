; DESCRIPTION: Renders a magenta line between points (171, 71) and (14, 168).
; PLAN: r0=171(x1), r1=71(y1), r2=14(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 71
LDI r2, 14
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
