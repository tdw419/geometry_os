; DESCRIPTION: Draws a yellow line from (0, 42) to (94, 42).
; PLAN: r0=0(x1), r1=42(y1), r2=94(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 42
LDI r2, 94
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
