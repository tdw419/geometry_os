; DESCRIPTION: Composite: . Then Places a blue circle of radius 40 at center (110, 110). Then Creates a purple rectangular region at (229, 160) spanning 17 by 66 pixels.
; PLAN: r0=110(x), r1=110(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=229(x), r1=160(y), r2=17(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue circle of radius 40 at center (110, 110).
; PLAN: r0=110(x), r1=110(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 110
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a purple rectangular region at (229, 160) spanning 17 by 66 pixels.
; PLAN: r0=229(x), r1=160(y), r2=17(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 160
LDI r2, 17
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
