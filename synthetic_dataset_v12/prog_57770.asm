; DESCRIPTION: Renders a purple line between points (403, 239) and (256, 212).
; PLAN: r0=403(x1), r1=239(y1), r2=256(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 239
LDI r2, 256
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
