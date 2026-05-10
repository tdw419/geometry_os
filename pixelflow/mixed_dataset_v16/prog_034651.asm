; DESCRIPTION: Draws a white line from (134, 121) to (263, 14).
; PLAN: r0=134(x1), r1=121(y1), r2=263(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 121
LDI r2, 263
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
