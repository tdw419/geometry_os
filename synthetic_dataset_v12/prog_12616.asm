; DESCRIPTION: Draws a white line from (509, 57) to (8, 72).
; PLAN: r0=509(x1), r1=57(y1), r2=8(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 57
LDI r2, 8
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
