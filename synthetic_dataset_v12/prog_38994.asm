; DESCRIPTION: Places a cyan line segment connecting (340, 219) to (53, 45).
; PLAN: r0=340(x1), r1=219(y1), r2=53(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 219
LDI r2, 53
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
