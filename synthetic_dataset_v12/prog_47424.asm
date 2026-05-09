; DESCRIPTION: Draws a white line from (460, 99) to (506, 235).
; PLAN: r0=460(x1), r1=99(y1), r2=506(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 99
LDI r2, 506
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
