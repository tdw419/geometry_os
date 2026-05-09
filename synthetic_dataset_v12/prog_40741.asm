; DESCRIPTION: Draws a white line from (510, 189) to (476, 59).
; PLAN: r0=510(x1), r1=189(y1), r2=476(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 189
LDI r2, 476
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
