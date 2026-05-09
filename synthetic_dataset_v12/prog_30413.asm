; DESCRIPTION: Creates a black rectangular region at (102, 39) spanning 111 by 32 pixels.
; PLAN: r0=102(x), r1=39(y), r2=111(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 39
LDI r2, 111
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
