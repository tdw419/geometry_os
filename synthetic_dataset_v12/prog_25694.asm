; DESCRIPTION: Places a black line segment connecting (481, 237) to (43, 235).
; PLAN: r0=481(x1), r1=237(y1), r2=43(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 237
LDI r2, 43
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
