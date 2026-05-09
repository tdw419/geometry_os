; DESCRIPTION: Draws a black line from (165, 168) to (134, 30).
; PLAN: r0=165(x1), r1=168(y1), r2=134(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 168
LDI r2, 134
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
