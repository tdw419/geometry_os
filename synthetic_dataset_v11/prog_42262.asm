; DESCRIPTION: Draws a magenta line from (76, 42) to (131, 21).
; PLAN: r0=76(x1), r1=42(y1), r2=131(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 42
LDI r2, 131
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
