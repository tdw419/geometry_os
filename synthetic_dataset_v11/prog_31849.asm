; DESCRIPTION: Draws a black line from (228, 232) to (65, 255).
; PLAN: r0=228(x1), r1=232(y1), r2=65(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 232
LDI r2, 65
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
