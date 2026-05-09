; DESCRIPTION: Creates a black rectangular region at (93, 103) spanning 83 by 60 pixels.
; PLAN: r0=93(x), r1=103(y), r2=83(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 103
LDI r2, 83
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
