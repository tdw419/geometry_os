; DESCRIPTION: Draws a magenta line from (83, 93) to (168, 252).
; PLAN: r0=83(x1), r1=93(y1), r2=168(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 93
LDI r2, 168
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
