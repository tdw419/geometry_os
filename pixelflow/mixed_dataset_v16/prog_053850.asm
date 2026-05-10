; DESCRIPTION: Draws a white line from (240, 17) to (336, 58).
; PLAN: r0=240(x1), r1=17(y1), r2=336(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 17
LDI r2, 336
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
