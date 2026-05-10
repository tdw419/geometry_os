; DESCRIPTION: Creates a white rectangular region at (195, 107) spanning 60 by 66 pixels.
; PLAN: r0=195(x), r1=107(y), r2=60(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 107
LDI r2, 60
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
