; DESCRIPTION: Composite: . Then Creates a black rectangular region at (26, 93) spanning 39 by 49 pixels. Then Draws a white circle centered at (111, 127) with radius 52.
; PLAN: r0=26(x), r1=93(y), r2=39(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=111(x), r1=127(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a black rectangular region at (26, 93) spanning 39 by 49 pixels.
; PLAN: r0=26(x), r1=93(y), r2=39(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 93
LDI r2, 39
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white circle centered at (111, 127) with radius 52.
; PLAN: r0=111(x), r1=127(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 127
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
