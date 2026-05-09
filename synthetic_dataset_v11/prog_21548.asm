; DESCRIPTION: Renders a white line between points (240, 235) and (114, 25).
; PLAN: r0=240(x1), r1=235(y1), r2=114(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 235
LDI r2, 114
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
