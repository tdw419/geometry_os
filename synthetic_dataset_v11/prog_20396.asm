; DESCRIPTION: Renders a magenta line between points (74, 146) and (120, 231).
; PLAN: r0=74(x1), r1=146(y1), r2=120(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 146
LDI r2, 120
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
