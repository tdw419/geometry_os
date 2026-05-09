; DESCRIPTION: Draws a yellow line from (46, 217) to (142, 42).
; PLAN: r0=46(x1), r1=217(y1), r2=142(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 217
LDI r2, 142
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
