; DESCRIPTION: Creates a white rectangular region at (228, 14) spanning 107 by 70 pixels.
; PLAN: r0=228(x), r1=14(y), r2=107(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 14
LDI r2, 107
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
