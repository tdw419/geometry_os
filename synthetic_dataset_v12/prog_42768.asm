; DESCRIPTION: Draws a black line from (2, 12) to (394, 101).
; PLAN: r0=2(x1), r1=12(y1), r2=394(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 12
LDI r2, 394
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
