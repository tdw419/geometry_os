; DESCRIPTION: Renders a cyan line between points (306, 235) and (67, 181).
; PLAN: r0=306(x1), r1=235(y1), r2=67(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 235
LDI r2, 67
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
