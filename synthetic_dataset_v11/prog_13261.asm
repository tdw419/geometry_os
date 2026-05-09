; DESCRIPTION: Creates a white rectangular region at (42, 210) spanning 94 by 34 pixels.
; PLAN: r0=42(x), r1=210(y), r2=94(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 210
LDI r2, 94
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
