; DESCRIPTION: Composite: . Then Draws a white rectangle at (24, 51) with width 26 and height 43. Then Creates a purple circular shape at (82, 127) with radius 55.
; PLAN: r0=24(x), r1=51(y), r2=26(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=82(x), r1=127(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white rectangle at (24, 51) with width 26 and height 43.
; PLAN: r0=24(x), r1=51(y), r2=26(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 51
LDI r2, 26
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (82, 127) with radius 55.
; PLAN: r0=82(x), r1=127(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 127
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
