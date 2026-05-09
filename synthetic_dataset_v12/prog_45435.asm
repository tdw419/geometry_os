; DESCRIPTION: Draws a black line from (239, 232) to (454, 50).
; PLAN: r0=239(x1), r1=232(y1), r2=454(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 232
LDI r2, 454
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
