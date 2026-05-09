; DESCRIPTION: Renders a blue line between points (239, 215) and (310, 240).
; PLAN: r0=239(x1), r1=215(y1), r2=310(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 215
LDI r2, 310
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
