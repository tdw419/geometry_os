; DESCRIPTION: Draws a cyan line from (184, 235) to (457, 4).
; PLAN: r0=184(x1), r1=235(y1), r2=457(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 235
LDI r2, 457
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
