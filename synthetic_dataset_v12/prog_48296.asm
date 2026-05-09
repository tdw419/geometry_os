; DESCRIPTION: Places a green line segment connecting (286, 1) to (209, 167).
; PLAN: r0=286(x1), r1=1(y1), r2=209(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 1
LDI r2, 209
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
