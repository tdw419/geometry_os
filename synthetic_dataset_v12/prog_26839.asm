; DESCRIPTION: Creates a white rectangular region at (228, 5) spanning 102 by 118 pixels.
; PLAN: r0=228(x), r1=5(y), r2=102(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 5
LDI r2, 102
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
