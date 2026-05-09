; DESCRIPTION: Places a green line segment connecting (182, 128) to (172, 237).
; PLAN: r0=182(x1), r1=128(y1), r2=172(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 128
LDI r2, 172
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
