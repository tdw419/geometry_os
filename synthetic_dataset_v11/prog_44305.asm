; DESCRIPTION: Renders a magenta line between points (16, 126) and (70, 138).
; PLAN: r0=16(x1), r1=126(y1), r2=70(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 126
LDI r2, 70
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
