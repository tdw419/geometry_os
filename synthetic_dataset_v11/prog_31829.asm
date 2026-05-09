; DESCRIPTION: Places a red line segment connecting (114, 136) to (209, 249).
; PLAN: r0=114(x1), r1=136(y1), r2=209(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 136
LDI r2, 209
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
