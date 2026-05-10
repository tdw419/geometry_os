; DESCRIPTION: Draws a white line from (464, 217) to (81, 184).
; PLAN: r0=464(x1), r1=217(y1), r2=81(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 217
LDI r2, 81
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
