; DESCRIPTION: Creates a white rectangular region at (55, 29) spanning 28 by 93 pixels.
; PLAN: r0=55(x), r1=29(y), r2=28(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 29
LDI r2, 28
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
