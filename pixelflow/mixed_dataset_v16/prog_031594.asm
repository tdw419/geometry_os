; DESCRIPTION: Draws a white line from (64, 247) to (427, 29).
; PLAN: r0=64(x1), r1=247(y1), r2=427(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 247
LDI r2, 427
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
