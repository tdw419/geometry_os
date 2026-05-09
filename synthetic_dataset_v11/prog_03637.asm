; DESCRIPTION: Renders a white line between points (203, 190) and (240, 73).
; PLAN: r0=203(x1), r1=190(y1), r2=240(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 190
LDI r2, 240
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
