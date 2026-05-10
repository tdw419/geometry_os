; DESCRIPTION: Places a black line segment connecting (215, 64) to (394, 241).
; PLAN: r0=215(x1), r1=64(y1), r2=394(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 64
LDI r2, 394
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
