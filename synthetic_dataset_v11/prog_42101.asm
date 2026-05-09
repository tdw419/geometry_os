; DESCRIPTION: Creates a white rectangular region at (148, 114) spanning 105 by 64 pixels.
; PLAN: r0=148(x), r1=114(y), r2=105(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 114
LDI r2, 105
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
