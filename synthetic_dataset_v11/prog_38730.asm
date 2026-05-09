; DESCRIPTION: Draws a magenta line from (215, 118) to (216, 42).
; PLAN: r0=215(x1), r1=118(y1), r2=216(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 118
LDI r2, 216
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
