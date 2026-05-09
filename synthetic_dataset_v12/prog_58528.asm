; DESCRIPTION: Draws a white line from (28, 85) to (253, 168).
; PLAN: r0=28(x1), r1=85(y1), r2=253(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 85
LDI r2, 253
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
