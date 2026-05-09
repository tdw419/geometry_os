; DESCRIPTION: Places a blue line segment connecting (239, 103) to (171, 121).
; PLAN: r0=239(x1), r1=103(y1), r2=171(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 103
LDI r2, 171
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
