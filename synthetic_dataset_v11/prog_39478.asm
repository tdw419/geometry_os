; DESCRIPTION: Draws a black line from (0, 27) to (255, 145).
; PLAN: r0=0(x1), r1=27(y1), r2=255(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 27
LDI r2, 255
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
