; DESCRIPTION: Draws a black line from (305, 235) to (498, 209).
; PLAN: r0=305(x1), r1=235(y1), r2=498(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 235
LDI r2, 498
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
