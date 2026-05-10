; DESCRIPTION: Creates a white rectangular region at (158, 55) spanning 16 by 15 pixels.
; PLAN: r0=158(x), r1=55(y), r2=16(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 55
LDI r2, 16
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
