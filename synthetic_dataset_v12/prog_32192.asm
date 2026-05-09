; DESCRIPTION: Renders a magenta line between points (312, 42) and (422, 249).
; PLAN: r0=312(x1), r1=42(y1), r2=422(x2), r3=249(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 42
LDI r2, 422
LDI r3, 249
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
