; DESCRIPTION: Creates a magenta rectangular region at (204, 29) spanning 43 by 39 pixels.
; PLAN: r0=204(x), r1=29(y), r2=43(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 29
LDI r2, 43
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
