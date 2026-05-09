; DESCRIPTION: Composite: . Then Places a green circle of radius 66 at center (99, 160). Then Creates a purple rectangular region at (3, 88) spanning 107 by 120 pixels.
; PLAN: r0=99(x), r1=160(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=3(x), r1=88(y), r2=107(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 66 at center (99, 160).
; PLAN: r0=99(x), r1=160(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 160
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a purple rectangular region at (3, 88) spanning 107 by 120 pixels.
; PLAN: r0=3(x), r1=88(y), r2=107(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 88
LDI r2, 107
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
