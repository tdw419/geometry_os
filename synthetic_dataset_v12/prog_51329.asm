; DESCRIPTION: Draws a white line from (146, 37) to (318, 92).
; PLAN: r0=146(x1), r1=37(y1), r2=318(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 37
LDI r2, 318
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
