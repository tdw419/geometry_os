; DESCRIPTION: Draws a white line from (163, 82) to (146, 152).
; PLAN: r0=163(x1), r1=82(y1), r2=146(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 82
LDI r2, 146
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
