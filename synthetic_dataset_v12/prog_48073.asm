; DESCRIPTION: Creates a yellow rectangular region at (437, 42) spanning 14 by 78 pixels.
; PLAN: r0=437(x), r1=42(y), r2=14(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 42
LDI r2, 14
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
