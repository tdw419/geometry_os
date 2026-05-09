; DESCRIPTION: Places a green line segment connecting (53, 17) to (167, 164).
; PLAN: r0=53(x1), r1=17(y1), r2=167(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 17
LDI r2, 167
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
