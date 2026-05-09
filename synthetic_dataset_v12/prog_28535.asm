; DESCRIPTION: Draws a white line from (310, 94) to (436, 253).
; PLAN: r0=310(x1), r1=94(y1), r2=436(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 94
LDI r2, 436
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
