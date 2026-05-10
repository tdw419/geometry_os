; DESCRIPTION: Renders a magenta line between points (46, 42) and (451, 103).
; PLAN: r0=46(x1), r1=42(y1), r2=451(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 42
LDI r2, 451
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
