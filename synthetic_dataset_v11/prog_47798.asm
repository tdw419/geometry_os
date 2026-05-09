; DESCRIPTION: Creates a white rectangular region at (42, 19) spanning 108 by 34 pixels.
; PLAN: r0=42(x), r1=19(y), r2=108(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 19
LDI r2, 108
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
