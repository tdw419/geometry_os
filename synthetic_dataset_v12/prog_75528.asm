; DESCRIPTION: Renders a black line between points (415, 50) and (81, 25).
; PLAN: r0=415(x1), r1=50(y1), r2=81(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 50
LDI r2, 81
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
