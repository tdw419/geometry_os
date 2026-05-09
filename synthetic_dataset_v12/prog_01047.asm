; DESCRIPTION: Places a purple line segment connecting (215, 25) to (310, 113).
; PLAN: r0=215(x1), r1=25(y1), r2=310(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 25
LDI r2, 310
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
