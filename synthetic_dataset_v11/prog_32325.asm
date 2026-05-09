; DESCRIPTION: Composite: . Then Draws a green circle centered at (65, 83) with radius 49. Then Creates a cyan rectangular region at (59, 58) spanning 24 by 22 pixels.
; PLAN: r0=65(x), r1=83(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=59(x), r1=58(y), r2=24(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (65, 83) with radius 49.
; PLAN: r0=65(x), r1=83(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 83
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a cyan rectangular region at (59, 58) spanning 24 by 22 pixels.
; PLAN: r0=59(x), r1=58(y), r2=24(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 58
LDI r2, 24
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
