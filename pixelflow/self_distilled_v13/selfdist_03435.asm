; DESCRIPTION: Draws a blue line from (142, 27) to (113, 53).
; PLAN: r0=142(x1), r1=27(y1), r2=113(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 27
LDI r2, 113
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
