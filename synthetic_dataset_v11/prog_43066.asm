; DESCRIPTION: Places a cyan line segment connecting (114, 178) to (232, 195).
; PLAN: r0=114(x1), r1=178(y1), r2=232(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 178
LDI r2, 232
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
