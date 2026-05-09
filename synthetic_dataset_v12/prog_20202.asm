; DESCRIPTION: Creates a white rectangular region at (73, 34) spanning 42 by 114 pixels.
; PLAN: r0=73(x), r1=34(y), r2=42(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 34
LDI r2, 42
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
