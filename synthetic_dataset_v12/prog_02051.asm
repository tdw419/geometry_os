; DESCRIPTION: Creates a red rectangular region at (190, 78) spanning 102 by 42 pixels.
; PLAN: r0=190(x), r1=78(y), r2=102(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 78
LDI r2, 102
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
