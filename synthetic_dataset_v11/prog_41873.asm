; DESCRIPTION: Places a yellow line segment connecting (172, 221) to (230, 10).
; PLAN: r0=172(x1), r1=221(y1), r2=230(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 221
LDI r2, 230
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
