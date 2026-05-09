; DESCRIPTION: Creates a magenta rectangular region at (258, 43) spanning 17 by 47 pixels.
; PLAN: r0=258(x), r1=43(y), r2=17(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 43
LDI r2, 17
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
