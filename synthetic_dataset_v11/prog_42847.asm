; DESCRIPTION: Draws a white line from (41, 128) to (111, 142).
; PLAN: r0=41(x1), r1=128(y1), r2=111(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 128
LDI r2, 111
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
