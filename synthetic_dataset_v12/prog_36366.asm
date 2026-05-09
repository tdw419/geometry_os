; DESCRIPTION: Creates a white rectangular region at (53, 142) spanning 93 by 103 pixels.
; PLAN: r0=53(x), r1=142(y), r2=93(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 142
LDI r2, 93
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
