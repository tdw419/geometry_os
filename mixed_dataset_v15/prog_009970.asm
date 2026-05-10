; DESCRIPTION: Draws a black line from (165, 5) to (416, 171).
; PLAN: r0=165(x1), r1=5(y1), r2=416(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 5
LDI r2, 416
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
