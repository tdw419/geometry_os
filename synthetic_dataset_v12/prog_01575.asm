; DESCRIPTION: Creates a white rectangular region at (50, 68) spanning 81 by 81 pixels.
; PLAN: r0=50(x), r1=68(y), r2=81(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 68
LDI r2, 81
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
