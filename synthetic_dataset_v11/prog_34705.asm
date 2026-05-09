; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (88, 127) with radius 31. Then Creates a white rectangular region at (184, 82) spanning 39 by 11 pixels.
; PLAN: r0=88(x), r1=127(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=184(x), r1=82(y), r2=39(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow circle centered at (88, 127) with radius 31.
; PLAN: r0=88(x), r1=127(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 127
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a white rectangular region at (184, 82) spanning 39 by 11 pixels.
; PLAN: r0=184(x), r1=82(y), r2=39(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 82
LDI r2, 39
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
