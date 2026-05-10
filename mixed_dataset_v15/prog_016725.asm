; DESCRIPTION: Renders a white line between points (474, 119) and (368, 151).
; PLAN: r0=474(x1), r1=119(y1), r2=368(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 119
LDI r2, 368
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
