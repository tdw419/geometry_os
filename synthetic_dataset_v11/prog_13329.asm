; DESCRIPTION: Composite: . Then Draws a green circle centered at (115, 157) with radius 46. Then Creates a white rectangular region at (84, 133) spanning 108 by 88 pixels.
; PLAN: r0=115(x), r1=157(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=84(x), r1=133(y), r2=108(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (115, 157) with radius 46.
; PLAN: r0=115(x), r1=157(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 157
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a white rectangular region at (84, 133) spanning 108 by 88 pixels.
; PLAN: r0=84(x), r1=133(y), r2=108(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 133
LDI r2, 108
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
