; DESCRIPTION: Draws a blue line from (434, 111) to (9, 53).
; PLAN: r0=434(x1), r1=111(y1), r2=9(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 111
LDI r2, 9
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
