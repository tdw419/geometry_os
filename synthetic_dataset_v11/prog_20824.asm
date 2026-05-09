; DESCRIPTION: Draws a white line from (161, 64) to (137, 184).
; PLAN: r0=161(x1), r1=64(y1), r2=137(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 64
LDI r2, 137
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
