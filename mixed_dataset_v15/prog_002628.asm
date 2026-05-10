; DESCRIPTION: Renders a cyan line between points (476, 235) and (423, 230).
; PLAN: r0=476(x1), r1=235(y1), r2=423(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 235
LDI r2, 423
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
