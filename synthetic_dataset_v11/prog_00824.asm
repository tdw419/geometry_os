; DESCRIPTION: Creates a white rectangular region at (85, 8) spanning 55 by 74 pixels.
; PLAN: r0=85(x), r1=8(y), r2=55(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 8
LDI r2, 55
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
