; DESCRIPTION: Creates a yellow rectangular region at (342, 63) spanning 19 by 28 pixels.
; PLAN: r0=342(x), r1=63(y), r2=19(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 63
LDI r2, 19
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
