; DESCRIPTION: Creates a yellow rectangular region at (366, 92) spanning 109 by 39 pixels.
; PLAN: r0=366(x), r1=92(y), r2=109(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 92
LDI r2, 109
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
