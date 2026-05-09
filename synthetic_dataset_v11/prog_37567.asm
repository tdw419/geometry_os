; DESCRIPTION: Renders a cyan line between points (246, 235) and (37, 236).
; PLAN: r0=246(x1), r1=235(y1), r2=37(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 235
LDI r2, 37
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
