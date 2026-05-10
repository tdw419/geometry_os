; DESCRIPTION: Places a black line segment connecting (384, 127) to (385, 178).
; PLAN: r0=384(x1), r1=127(y1), r2=385(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 127
LDI r2, 385
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
