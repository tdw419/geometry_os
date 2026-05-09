; DESCRIPTION: Composite: . Then Creates a green rectangular region at (71, 168) spanning 99 by 53 pixels. Then Draws a purple circle centered at (86, 94) with radius 49.
; PLAN: r0=71(x), r1=168(y), r2=99(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=86(x), r1=94(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a green rectangular region at (71, 168) spanning 99 by 53 pixels.
; PLAN: r0=71(x), r1=168(y), r2=99(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 168
LDI r2, 99
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (86, 94) with radius 49.
; PLAN: r0=86(x), r1=94(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 94
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
