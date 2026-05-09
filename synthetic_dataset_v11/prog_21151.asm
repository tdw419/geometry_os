; DESCRIPTION: Creates a yellow rectangular region at (74, 143) spanning 39 by 62 pixels.
; PLAN: r0=74(x), r1=143(y), r2=39(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 143
LDI r2, 39
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
