; DESCRIPTION: Draws a yellow line from (184, 47) to (171, 23).
; PLAN: r0=184(x1), r1=47(y1), r2=171(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 47
LDI r2, 171
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
