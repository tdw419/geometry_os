; DESCRIPTION: Draws a white line from (95, 121) to (85, 59).
; PLAN: r0=95(x1), r1=121(y1), r2=85(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 121
LDI r2, 85
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
