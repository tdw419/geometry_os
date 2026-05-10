; DESCRIPTION: Draws a white line from (138, 63) to (466, 178).
; PLAN: r0=138(x1), r1=63(y1), r2=466(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 63
LDI r2, 466
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
