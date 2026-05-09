; DESCRIPTION: Renders a red line between points (122, 237) and (209, 56).
; PLAN: r0=122(x1), r1=237(y1), r2=209(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 237
LDI r2, 209
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
