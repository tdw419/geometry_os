; DESCRIPTION: Places a cyan line segment connecting (411, 237) to (183, 15).
; PLAN: r0=411(x1), r1=237(y1), r2=183(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 237
LDI r2, 183
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
