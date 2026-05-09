; DESCRIPTION: Draws a black line from (398, 184) to (381, 103).
; PLAN: r0=398(x1), r1=184(y1), r2=381(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 184
LDI r2, 381
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
