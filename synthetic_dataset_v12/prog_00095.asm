; DESCRIPTION: Places a green line segment connecting (494, 49) to (362, 233).
; PLAN: r0=494(x1), r1=49(y1), r2=362(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 49
LDI r2, 362
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
