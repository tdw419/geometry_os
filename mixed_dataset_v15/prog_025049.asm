; DESCRIPTION: Creates a white rectangular region at (341, 42) spanning 57 by 61 pixels.
; PLAN: r0=341(x), r1=42(y), r2=57(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 42
LDI r2, 57
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
