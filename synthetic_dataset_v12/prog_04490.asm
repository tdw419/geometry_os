; DESCRIPTION: Draws a blue line from (387, 118) to (245, 42).
; PLAN: r0=387(x1), r1=118(y1), r2=245(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 118
LDI r2, 245
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
