; DESCRIPTION: Composite: . Then Draws a black circle centered at (140, 69) with radius 61. Then Renders a red box of size 109x42 starting at (117, 97).
; PLAN: r0=140(x), r1=69(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=117(x), r1=97(y), r2=109(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black circle centered at (140, 69) with radius 61.
; PLAN: r0=140(x), r1=69(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 69
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red box of size 109x42 starting at (117, 97).
; PLAN: r0=117(x), r1=97(y), r2=109(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 97
LDI r2, 109
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
