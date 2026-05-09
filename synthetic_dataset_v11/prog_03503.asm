; DESCRIPTION: Composite: . Then Places a black circle of radius 16 at center (116, 99). Then Draws a purple line from (138, 104) to (187, 73).
; PLAN: r0=116(x), r1=99(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=138(x1), r1=104(y1), r2=187(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black circle of radius 16 at center (116, 99).
; PLAN: r0=116(x), r1=99(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 99
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple line from (138, 104) to (187, 73).
; PLAN: r0=138(x1), r1=104(y1), r2=187(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 104
LDI r2, 187
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
