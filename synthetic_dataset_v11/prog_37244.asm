; DESCRIPTION: Composite: . Then Draws a green rectangle at (133, 70) with width 60 and height 13. Then Creates a magenta circular shape at (157, 107) with radius 49.
; PLAN: r0=133(x), r1=70(y), r2=60(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=157(x), r1=107(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green rectangle at (133, 70) with width 60 and height 13.
; PLAN: r0=133(x), r1=70(y), r2=60(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 70
LDI r2, 60
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta circular shape at (157, 107) with radius 49.
; PLAN: r0=157(x), r1=107(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 107
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
