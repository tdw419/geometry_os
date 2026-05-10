; DESCRIPTION: Places a green line segment connecting (170, 213) to (182, 116).
; PLAN: r0=170(x1), r1=213(y1), r2=182(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 213
LDI r2, 182
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
