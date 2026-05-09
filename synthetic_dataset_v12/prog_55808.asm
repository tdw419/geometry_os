; DESCRIPTION: Renders a white line between points (135, 210) and (235, 114).
; PLAN: r0=135(x1), r1=210(y1), r2=235(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 210
LDI r2, 235
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
