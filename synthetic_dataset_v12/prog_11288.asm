; DESCRIPTION: Creates a white rectangular region at (34, 196) spanning 101 by 40 pixels.
; PLAN: r0=34(x), r1=196(y), r2=101(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 196
LDI r2, 101
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
