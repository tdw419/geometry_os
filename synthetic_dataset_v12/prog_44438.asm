; DESCRIPTION: Draws a green line from (458, 217) to (132, 42).
; PLAN: r0=458(x1), r1=217(y1), r2=132(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 217
LDI r2, 132
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
