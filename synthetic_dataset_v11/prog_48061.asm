; DESCRIPTION: Places a blue line segment connecting (233, 239) to (37, 143).
; PLAN: r0=233(x1), r1=239(y1), r2=37(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 239
LDI r2, 37
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
