; DESCRIPTION: Creates a yellow rectangular region at (358, 148) spanning 39 by 28 pixels.
; PLAN: r0=358(x), r1=148(y), r2=39(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 148
LDI r2, 39
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
