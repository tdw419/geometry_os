; DESCRIPTION: Draws a orange line from (70, 121) to (502, 115).
; PLAN: r0=70(x1), r1=121(y1), r2=502(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 121
LDI r2, 502
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
