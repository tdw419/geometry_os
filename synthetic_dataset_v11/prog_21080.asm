; DESCRIPTION: Renders a blue line between points (203, 167) and (129, 113).
; PLAN: r0=203(x1), r1=167(y1), r2=129(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 167
LDI r2, 129
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
