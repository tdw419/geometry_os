; DESCRIPTION: Places a blue line segment connecting (167, 231) to (82, 121).
; PLAN: r0=167(x1), r1=231(y1), r2=82(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 231
LDI r2, 82
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
