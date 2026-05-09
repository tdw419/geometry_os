; DESCRIPTION: Renders a yellow line between points (114, 82) and (203, 173).
; PLAN: r0=114(x1), r1=82(y1), r2=203(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 82
LDI r2, 203
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
