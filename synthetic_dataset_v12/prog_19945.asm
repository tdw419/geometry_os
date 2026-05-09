; DESCRIPTION: Draws a black line from (265, 28) to (24, 142).
; PLAN: r0=265(x1), r1=28(y1), r2=24(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 28
LDI r2, 24
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
