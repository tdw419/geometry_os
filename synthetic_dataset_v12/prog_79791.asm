; DESCRIPTION: Draws a magenta line from (245, 42) to (293, 103).
; PLAN: r0=245(x1), r1=42(y1), r2=293(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 42
LDI r2, 293
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
