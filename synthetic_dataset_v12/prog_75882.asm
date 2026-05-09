; DESCRIPTION: Draws a blue line from (333, 162) to (456, 103).
; PLAN: r0=333(x1), r1=162(y1), r2=456(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 162
LDI r2, 456
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
