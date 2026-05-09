; DESCRIPTION: Composite: . Then Draws a black circle centered at (197, 156) with radius 44. Then Renders a green box of size 110x45 starting at (58, 120).
; PLAN: r0=197(x), r1=156(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=58(x), r1=120(y), r2=110(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black circle centered at (197, 156) with radius 44.
; PLAN: r0=197(x), r1=156(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 156
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a green box of size 110x45 starting at (58, 120).
; PLAN: r0=58(x), r1=120(y), r2=110(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 120
LDI r2, 110
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
