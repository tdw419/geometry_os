; DESCRIPTION: Creates a yellow rectangular region at (213, 76) spanning 96 by 113 pixels.
; PLAN: r0=213(x), r1=76(y), r2=96(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 76
LDI r2, 96
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
