; DESCRIPTION: Creates a white rectangular region at (59, 101) spanning 60 by 25 pixels.
; PLAN: r0=59(x), r1=101(y), r2=60(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 101
LDI r2, 60
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
