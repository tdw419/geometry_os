; DESCRIPTION: Draws a black line from (73, 116) to (370, 255).
; PLAN: r0=73(x1), r1=116(y1), r2=370(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 116
LDI r2, 370
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
