; DESCRIPTION: Renders a magenta line between points (247, 134) and (198, 243).
; PLAN: r0=247(x1), r1=134(y1), r2=198(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 134
LDI r2, 198
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
