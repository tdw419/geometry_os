; DESCRIPTION: Renders a magenta line between points (281, 68) and (461, 29).
; PLAN: r0=281(x1), r1=68(y1), r2=461(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 68
LDI r2, 461
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
