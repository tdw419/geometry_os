; DESCRIPTION: Creates a white rectangular region at (85, 167) spanning 107 by 45 pixels.
; PLAN: r0=85(x), r1=167(y), r2=107(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 167
LDI r2, 107
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
