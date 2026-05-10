; DESCRIPTION: Places a cyan line segment connecting (55, 79) to (33, 157).
; PLAN: r0=55(x1), r1=79(y1), r2=33(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 79
LDI r2, 33
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
