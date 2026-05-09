; DESCRIPTION: Places a red line segment connecting (362, 83) to (60, 53).
; PLAN: r0=362(x1), r1=83(y1), r2=60(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 83
LDI r2, 60
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
