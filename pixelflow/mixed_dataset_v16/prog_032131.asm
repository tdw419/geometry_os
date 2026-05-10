; DESCRIPTION: Draws a black line from (265, 152) to (6, 240).
; PLAN: r0=265(x1), r1=152(y1), r2=6(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 152
LDI r2, 6
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
