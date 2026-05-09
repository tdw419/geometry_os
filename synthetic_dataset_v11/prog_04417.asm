; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (157, 205) spanning 68 by 25 pixels. Then Draws a black circle centered at (54, 166) with radius 14.
; PLAN: r0=157(x), r1=205(y), r2=68(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=54(x), r1=166(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a magenta rectangular region at (157, 205) spanning 68 by 25 pixels.
; PLAN: r0=157(x), r1=205(y), r2=68(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 205
LDI r2, 68
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (54, 166) with radius 14.
; PLAN: r0=54(x), r1=166(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 166
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
