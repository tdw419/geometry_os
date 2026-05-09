; DESCRIPTION: Places a green line segment connecting (362, 121) to (71, 131).
; PLAN: r0=362(x1), r1=121(y1), r2=71(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 121
LDI r2, 71
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
