; DESCRIPTION: Renders a purple line between points (350, 239) and (81, 150).
; PLAN: r0=350(x1), r1=239(y1), r2=81(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 239
LDI r2, 81
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
