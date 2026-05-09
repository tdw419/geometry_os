; DESCRIPTION: Composite: . Then Draws a green circle centered at (70, 72) with radius 60. Then Creates a red rectangular region at (57, 83) spanning 59 by 100 pixels.
; PLAN: r0=70(x), r1=72(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=57(x), r1=83(y), r2=59(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (70, 72) with radius 60.
; PLAN: r0=70(x), r1=72(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 72
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a red rectangular region at (57, 83) spanning 59 by 100 pixels.
; PLAN: r0=57(x), r1=83(y), r2=59(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 83
LDI r2, 59
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
