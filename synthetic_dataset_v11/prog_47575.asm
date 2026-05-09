; DESCRIPTION: Creates a red rectangular region at (10, 54) spanning 32 by 35 pixels.
; PLAN: r0=10(x), r1=54(y), r2=32(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 54
LDI r2, 32
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
