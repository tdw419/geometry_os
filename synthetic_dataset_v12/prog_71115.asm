; DESCRIPTION: Places a white line segment connecting (165, 127) to (412, 74).
; PLAN: r0=165(x1), r1=127(y1), r2=412(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 127
LDI r2, 412
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
