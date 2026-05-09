; DESCRIPTION: Renders a blue line between points (94, 239) and (48, 122).
; PLAN: r0=94(x1), r1=239(y1), r2=48(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 239
LDI r2, 48
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
