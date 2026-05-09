; DESCRIPTION: Draws a blue line from (351, 47) to (284, 53).
; PLAN: r0=351(x1), r1=47(y1), r2=284(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 47
LDI r2, 284
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
