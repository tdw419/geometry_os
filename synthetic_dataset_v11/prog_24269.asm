; DESCRIPTION: Composite: . Then Creates a green rectangular region at (42, 65) spanning 101 by 19 pixels. Then Draws a green circle centered at (87, 132) with radius 65.
; PLAN: r0=42(x), r1=65(y), r2=101(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=87(x), r1=132(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a green rectangular region at (42, 65) spanning 101 by 19 pixels.
; PLAN: r0=42(x), r1=65(y), r2=101(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 65
LDI r2, 101
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (87, 132) with radius 65.
; PLAN: r0=87(x), r1=132(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 132
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
