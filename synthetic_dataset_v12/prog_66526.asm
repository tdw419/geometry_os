; DESCRIPTION: Renders a yellow line between points (203, 61) and (474, 135).
; PLAN: r0=203(x1), r1=61(y1), r2=474(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 61
LDI r2, 474
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
