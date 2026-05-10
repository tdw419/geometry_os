; DESCRIPTION: Draws a black line from (409, 235) to (173, 16).
; PLAN: r0=409(x1), r1=235(y1), r2=173(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 235
LDI r2, 173
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
