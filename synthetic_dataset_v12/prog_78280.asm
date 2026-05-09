; DESCRIPTION: Places a cyan line segment connecting (79, 167) to (304, 137).
; PLAN: r0=79(x1), r1=167(y1), r2=304(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 167
LDI r2, 304
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
