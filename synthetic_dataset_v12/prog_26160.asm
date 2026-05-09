; DESCRIPTION: Draws a black line from (270, 202) to (128, 92).
; PLAN: r0=270(x1), r1=202(y1), r2=128(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 202
LDI r2, 128
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
