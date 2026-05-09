; DESCRIPTION: Places a yellow line segment connecting (488, 143) to (488, 118).
; PLAN: r0=488(x1), r1=143(y1), r2=488(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 143
LDI r2, 488
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
