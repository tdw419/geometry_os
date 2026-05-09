; DESCRIPTION: Places a green line segment connecting (53, 107) to (71, 127).
; PLAN: r0=53(x1), r1=107(y1), r2=71(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 107
LDI r2, 71
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
