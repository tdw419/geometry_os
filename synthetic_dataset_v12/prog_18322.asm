; DESCRIPTION: Draws a purple line from (209, 191) to (262, 42).
; PLAN: r0=209(x1), r1=191(y1), r2=262(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 191
LDI r2, 262
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
