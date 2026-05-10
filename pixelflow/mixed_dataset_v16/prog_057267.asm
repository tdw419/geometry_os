; DESCRIPTION: Creates a black rectangular region at (354, 131) spanning 53 by 113 pixels.
; PLAN: r0=354(x), r1=131(y), r2=53(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 131
LDI r2, 53
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
