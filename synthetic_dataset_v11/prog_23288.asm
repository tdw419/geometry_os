; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (16, 94) spanning 70 by 83 pixels. Then Draws a yellow circle centered at (95, 178) with radius 74.
; PLAN: r0=16(x), r1=94(y), r2=70(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=95(x), r1=178(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a yellow rectangular region at (16, 94) spanning 70 by 83 pixels.
; PLAN: r0=16(x), r1=94(y), r2=70(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 94
LDI r2, 70
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (95, 178) with radius 74.
; PLAN: r0=95(x), r1=178(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 178
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
