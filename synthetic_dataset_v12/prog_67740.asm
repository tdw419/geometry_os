; DESCRIPTION: Creates a white rectangular region at (126, 39) spanning 14 by 89 pixels.
; PLAN: r0=126(x), r1=39(y), r2=14(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 39
LDI r2, 14
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
