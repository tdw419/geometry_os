; DESCRIPTION: Places a green line segment connecting (210, 49) to (121, 83).
; PLAN: r0=210(x1), r1=49(y1), r2=121(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 49
LDI r2, 121
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
