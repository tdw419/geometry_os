; DESCRIPTION: Renders a black line between points (440, 199) and (354, 127).
; PLAN: r0=440(x1), r1=199(y1), r2=354(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 199
LDI r2, 354
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
