; DESCRIPTION: Renders a cyan line between points (55, 235) and (26, 21).
; PLAN: r0=55(x1), r1=235(y1), r2=26(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 235
LDI r2, 26
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
