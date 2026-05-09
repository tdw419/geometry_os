; DESCRIPTION: Draws a cyan line from (139, 235) to (246, 184).
; PLAN: r0=139(x1), r1=235(y1), r2=246(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 235
LDI r2, 246
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
