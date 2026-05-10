; DESCRIPTION: Draws a black line from (393, 21) to (241, 255).
; PLAN: r0=393(x1), r1=21(y1), r2=241(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 21
LDI r2, 241
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
