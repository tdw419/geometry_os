; DESCRIPTION: Creates a white rectangular region at (49, 25) spanning 10 by 93 pixels.
; PLAN: r0=49(x), r1=25(y), r2=10(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 25
LDI r2, 10
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
