; DESCRIPTION: Composite: . Then Places a yellow circle of radius 54 at center (71, 145). Then Creates a green rectangular region at (130, 65) spanning 114 by 45 pixels.
; PLAN: r0=71(x), r1=145(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=130(x), r1=65(y), r2=114(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 54 at center (71, 145).
; PLAN: r0=71(x), r1=145(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 145
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a green rectangular region at (130, 65) spanning 114 by 45 pixels.
; PLAN: r0=130(x), r1=65(y), r2=114(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 65
LDI r2, 114
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
