; DESCRIPTION: Composite: . Then Draws a black line from (62, 195) to (31, 0). Then Places a purple circle of radius 28 at center (182, 207).
; PLAN: r0=62(x1), r1=195(y1), r2=31(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=182(x), r1=207(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black line from (62, 195) to (31, 0).
; PLAN: r0=62(x1), r1=195(y1), r2=31(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 195
LDI r2, 31
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 28 at center (182, 207).
; PLAN: r0=182(x), r1=207(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 207
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
