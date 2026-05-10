; DESCRIPTION: Draws a black line from (476, 196) to (509, 107).
; PLAN: r0=476(x1), r1=196(y1), r2=509(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 196
LDI r2, 509
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
