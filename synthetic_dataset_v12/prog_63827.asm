; DESCRIPTION: Creates a white rectangular region at (114, 167) spanning 50 by 37 pixels.
; PLAN: r0=114(x), r1=167(y), r2=50(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 167
LDI r2, 50
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
