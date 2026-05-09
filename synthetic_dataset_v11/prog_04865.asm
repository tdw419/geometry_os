; DESCRIPTION: Creates a red rectangular region at (31, 126) spanning 28 by 16 pixels.
; PLAN: r0=31(x), r1=126(y), r2=28(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 126
LDI r2, 28
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
