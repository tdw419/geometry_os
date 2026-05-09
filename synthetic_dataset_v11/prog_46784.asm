; DESCRIPTION: Creates a white rectangular region at (154, 52) spanning 34 by 101 pixels.
; PLAN: r0=154(x), r1=52(y), r2=34(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 52
LDI r2, 34
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
