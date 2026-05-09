; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (43, 13) spanning 73 by 79 pixels. Then Draws a blue circle centered at (90, 213) with radius 31.
; PLAN: r0=43(x), r1=13(y), r2=73(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=90(x), r1=213(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a magenta rectangular region at (43, 13) spanning 73 by 79 pixels.
; PLAN: r0=43(x), r1=13(y), r2=73(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 13
LDI r2, 73
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (90, 213) with radius 31.
; PLAN: r0=90(x), r1=213(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 213
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
