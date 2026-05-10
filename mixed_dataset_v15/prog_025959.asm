; DESCRIPTION: Places a cyan line segment connecting (194, 73) to (18, 81).
; PLAN: r0=194(x1), r1=73(y1), r2=18(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 73
LDI r2, 18
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
