; DESCRIPTION: Places a green line segment connecting (94, 239) to (182, 67).
; PLAN: r0=94(x1), r1=239(y1), r2=182(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 239
LDI r2, 182
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
