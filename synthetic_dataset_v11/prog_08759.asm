; DESCRIPTION: Places a black line segment connecting (197, 173) to (60, 58).
; PLAN: r0=197(x1), r1=173(y1), r2=60(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 173
LDI r2, 60
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
