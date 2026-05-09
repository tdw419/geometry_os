; DESCRIPTION: Draws a white line from (185, 75) to (205, 42).
; PLAN: r0=185(x1), r1=75(y1), r2=205(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 75
LDI r2, 205
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
