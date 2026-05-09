; DESCRIPTION: Creates a white rectangular region at (77, 107) spanning 74 by 85 pixels.
; PLAN: r0=77(x), r1=107(y), r2=74(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 107
LDI r2, 74
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
