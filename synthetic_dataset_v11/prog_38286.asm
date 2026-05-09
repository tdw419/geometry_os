; DESCRIPTION: Places a green line segment connecting (61, 121) to (136, 113).
; PLAN: r0=61(x1), r1=121(y1), r2=136(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 121
LDI r2, 136
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
