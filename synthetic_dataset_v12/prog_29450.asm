; DESCRIPTION: Places a cyan line segment connecting (386, 45) to (366, 116).
; PLAN: r0=386(x1), r1=45(y1), r2=366(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 45
LDI r2, 366
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
