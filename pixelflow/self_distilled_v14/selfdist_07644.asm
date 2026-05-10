; DESCRIPTION: Draws a white line from (127, 121) to (193, 81).
; PLAN: r0=127(x1), r1=121(y1), r2=193(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 121
LDI r2, 193
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
