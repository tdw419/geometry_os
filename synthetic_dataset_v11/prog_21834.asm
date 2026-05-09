; DESCRIPTION: Draws a white line from (103, 95) to (95, 3).
; PLAN: r0=103(x1), r1=95(y1), r2=95(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 95
LDI r2, 95
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
