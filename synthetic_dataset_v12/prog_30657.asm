; DESCRIPTION: Places a green line segment connecting (74, 121) to (482, 178).
; PLAN: r0=74(x1), r1=121(y1), r2=482(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 121
LDI r2, 482
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
