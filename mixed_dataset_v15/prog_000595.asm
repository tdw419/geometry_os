; DESCRIPTION: Creates a white rectangular region at (189, 173) spanning 94 by 12 pixels.
; PLAN: r0=189(x), r1=173(y), r2=94(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 173
LDI r2, 94
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
