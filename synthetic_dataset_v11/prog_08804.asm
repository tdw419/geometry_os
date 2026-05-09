; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (196, 109) spanning 26 by 63 pixels. Then Draws a green circle centered at (53, 223) with radius 14.
; PLAN: r0=196(x), r1=109(y), r2=26(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=53(x), r1=223(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a blue rectangular region at (196, 109) spanning 26 by 63 pixels.
; PLAN: r0=196(x), r1=109(y), r2=26(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 109
LDI r2, 26
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (53, 223) with radius 14.
; PLAN: r0=53(x), r1=223(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 223
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
