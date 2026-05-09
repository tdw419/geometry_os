; DESCRIPTION: Draws a black line from (173, 91) to (30, 103).
; PLAN: r0=173(x1), r1=91(y1), r2=30(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 91
LDI r2, 30
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
