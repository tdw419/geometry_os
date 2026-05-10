; DESCRIPTION: Draws a blue line from (71, 126) to (241, 53).
; PLAN: r0=71(x1), r1=126(y1), r2=241(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 126
LDI r2, 241
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
