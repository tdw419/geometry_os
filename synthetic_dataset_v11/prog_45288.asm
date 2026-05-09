; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (31, 128) spanning 76 by 10 pixels. Then Draws a red circle centered at (140, 146) with radius 65.
; PLAN: r0=31(x), r1=128(y), r2=76(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=140(x), r1=146(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a magenta rectangular region at (31, 128) spanning 76 by 10 pixels.
; PLAN: r0=31(x), r1=128(y), r2=76(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 128
LDI r2, 76
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red circle centered at (140, 146) with radius 65.
; PLAN: r0=140(x), r1=146(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 146
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
