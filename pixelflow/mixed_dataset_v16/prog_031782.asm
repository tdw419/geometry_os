; DESCRIPTION: Places a cyan line segment connecting (19, 41) to (387, 194).
; PLAN: r0=19(x1), r1=41(y1), r2=387(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 41
LDI r2, 387
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
