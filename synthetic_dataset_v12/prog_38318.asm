; DESCRIPTION: Renders a blue line between points (215, 17) and (338, 166).
; PLAN: r0=215(x1), r1=17(y1), r2=338(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 17
LDI r2, 338
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
