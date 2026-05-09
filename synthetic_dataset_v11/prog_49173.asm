; DESCRIPTION: Composite: . Then Draws a blue circle centered at (65, 108) with radius 12. Then Creates a red rectangular region at (175, 98) spanning 16 by 80 pixels.
; PLAN: r0=65(x), r1=108(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=175(x), r1=98(y), r2=16(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (65, 108) with radius 12.
; PLAN: r0=65(x), r1=108(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 108
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a red rectangular region at (175, 98) spanning 16 by 80 pixels.
; PLAN: r0=175(x), r1=98(y), r2=16(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 98
LDI r2, 16
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
