; DESCRIPTION: Composite: . Then Draws a blue circle centered at (132, 137) with radius 36. Then Creates a red rectangular region at (89, 58) spanning 103 by 56 pixels.
; PLAN: r0=132(x), r1=137(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=89(x), r1=58(y), r2=103(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (132, 137) with radius 36.
; PLAN: r0=132(x), r1=137(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 137
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a red rectangular region at (89, 58) spanning 103 by 56 pixels.
; PLAN: r0=89(x), r1=58(y), r2=103(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 58
LDI r2, 103
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
