; DESCRIPTION: Places a cyan line segment connecting (122, 114) to (21, 178).
; PLAN: r0=122(x1), r1=114(y1), r2=21(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 114
LDI r2, 21
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
