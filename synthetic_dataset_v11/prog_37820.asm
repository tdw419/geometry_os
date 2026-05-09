; DESCRIPTION: Renders a magenta line between points (243, 93) and (21, 65).
; PLAN: r0=243(x1), r1=93(y1), r2=21(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 93
LDI r2, 21
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
