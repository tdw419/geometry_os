; DESCRIPTION: Creates a yellow rectangular region at (330, 37) spanning 15 by 53 pixels.
; PLAN: r0=330(x), r1=37(y), r2=15(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 37
LDI r2, 15
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
