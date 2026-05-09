; DESCRIPTION: Draws a magenta line from (416, 251) to (71, 42).
; PLAN: r0=416(x1), r1=251(y1), r2=71(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 251
LDI r2, 71
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
