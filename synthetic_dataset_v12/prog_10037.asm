; DESCRIPTION: Draws a white line from (247, 216) to (7, 42).
; PLAN: r0=247(x1), r1=216(y1), r2=7(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 216
LDI r2, 7
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
