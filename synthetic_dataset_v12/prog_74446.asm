; DESCRIPTION: Creates a yellow rectangular region at (42, 100) spanning 47 by 102 pixels.
; PLAN: r0=42(x), r1=100(y), r2=47(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 100
LDI r2, 47
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
