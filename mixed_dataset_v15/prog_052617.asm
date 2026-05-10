; DESCRIPTION: Renders a black line between points (59, 144) and (354, 235).
; PLAN: r0=59(x1), r1=144(y1), r2=354(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 144
LDI r2, 354
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
