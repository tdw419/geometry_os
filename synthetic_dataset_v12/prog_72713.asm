; DESCRIPTION: Places a blue line segment connecting (217, 121) to (240, 156).
; PLAN: r0=217(x1), r1=121(y1), r2=240(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 121
LDI r2, 240
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
