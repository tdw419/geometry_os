; DESCRIPTION: Draws a white line from (40, 181) to (27, 37).
; PLAN: r0=40(x1), r1=181(y1), r2=27(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 181
LDI r2, 27
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
