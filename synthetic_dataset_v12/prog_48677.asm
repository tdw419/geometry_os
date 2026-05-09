; DESCRIPTION: Draws a black line from (42, 17) to (436, 75).
; PLAN: r0=42(x1), r1=17(y1), r2=436(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 17
LDI r2, 436
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
