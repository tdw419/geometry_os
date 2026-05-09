; DESCRIPTION: Creates a white rectangular region at (104, 173) spanning 102 by 71 pixels.
; PLAN: r0=104(x), r1=173(y), r2=102(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 173
LDI r2, 102
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
