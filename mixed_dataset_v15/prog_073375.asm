; DESCRIPTION: Draws a white line from (55, 121) to (180, 13).
; PLAN: r0=55(x1), r1=121(y1), r2=180(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 121
LDI r2, 180
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
