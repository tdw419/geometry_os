; DESCRIPTION: Composite: . Then Places a purple circle of radius 20 at center (167, 137). Then Creates a purple rectangular region at (160, 45) spanning 65 by 60 pixels.
; PLAN: r0=167(x), r1=137(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=160(x), r1=45(y), r2=65(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple circle of radius 20 at center (167, 137).
; PLAN: r0=167(x), r1=137(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 137
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a purple rectangular region at (160, 45) spanning 65 by 60 pixels.
; PLAN: r0=160(x), r1=45(y), r2=65(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 45
LDI r2, 65
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
