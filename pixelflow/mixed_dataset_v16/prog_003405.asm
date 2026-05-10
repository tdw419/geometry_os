; DESCRIPTION: Draws a magenta line from (168, 126) to (293, 12).
; PLAN: r0=168(x1), r1=126(y1), r2=293(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 126
LDI r2, 293
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
