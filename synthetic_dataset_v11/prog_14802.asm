; DESCRIPTION: Composite: . Then Renders a red box of size 58x109 starting at (4, 45). Then Draws a purple circle centered at (75, 211) with radius 13.
; PLAN: r0=4(x), r1=45(y), r2=58(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=75(x), r1=211(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red box of size 58x109 starting at (4, 45).
; PLAN: r0=4(x), r1=45(y), r2=58(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 45
LDI r2, 58
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (75, 211) with radius 13.
; PLAN: r0=75(x), r1=211(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 211
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
