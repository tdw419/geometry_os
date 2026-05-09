; DESCRIPTION: Creates a black rectangular region at (102, 140) spanning 93 by 25 pixels.
; PLAN: r0=102(x), r1=140(y), r2=93(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 140
LDI r2, 93
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
