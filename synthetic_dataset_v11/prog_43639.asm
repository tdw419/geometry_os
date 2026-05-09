; DESCRIPTION: Composite: . Then Places a purple circle of radius 72 at center (125, 94). Then Places a purple 26x112 rectangle at position (186, 97).
; PLAN: r0=125(x), r1=94(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=186(x), r1=97(y), r2=26(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple circle of radius 72 at center (125, 94).
; PLAN: r0=125(x), r1=94(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 94
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple 26x112 rectangle at position (186, 97).
; PLAN: r0=186(x), r1=97(y), r2=26(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 97
LDI r2, 26
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
