; DESCRIPTION: Creates a white rectangular region at (81, 126) spanning 12 by 49 pixels.
; PLAN: r0=81(x), r1=126(y), r2=12(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 126
LDI r2, 12
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
