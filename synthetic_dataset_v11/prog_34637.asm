; DESCRIPTION: Composite: . Then Draws a red circle centered at (43, 79) with radius 30. Then Creates a magenta rectangular region at (126, 206) spanning 118 by 43 pixels.
; PLAN: r0=43(x), r1=79(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=126(x), r1=206(y), r2=118(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (43, 79) with radius 30.
; PLAN: r0=43(x), r1=79(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 79
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a magenta rectangular region at (126, 206) spanning 118 by 43 pixels.
; PLAN: r0=126(x), r1=206(y), r2=118(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 206
LDI r2, 118
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
