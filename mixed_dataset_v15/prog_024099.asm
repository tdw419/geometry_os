; DESCRIPTION: Draws a magenta line from (288, 42) to (262, 170).
; PLAN: r0=288(x1), r1=42(y1), r2=262(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 42
LDI r2, 262
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
