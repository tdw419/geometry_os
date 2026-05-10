; DESCRIPTION: Draws a black line from (292, 25) to (372, 176).
; PLAN: r0=292(x1), r1=25(y1), r2=372(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 25
LDI r2, 372
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
