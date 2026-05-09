; DESCRIPTION: Composite: . Then Creates a black rectangular region at (27, 127) spanning 110 by 101 pixels. Then Renders a purple disk with center (75, 211) and radius 33.
; PLAN: r0=27(x), r1=127(y), r2=110(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=75(x), r1=211(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a black rectangular region at (27, 127) spanning 110 by 101 pixels.
; PLAN: r0=27(x), r1=127(y), r2=110(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 127
LDI r2, 110
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (75, 211) and radius 33.
; PLAN: r0=75(x), r1=211(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 211
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
