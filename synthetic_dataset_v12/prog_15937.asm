; DESCRIPTION: Draws a white line from (73, 121) to (300, 161).
; PLAN: r0=73(x1), r1=121(y1), r2=300(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 121
LDI r2, 300
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
