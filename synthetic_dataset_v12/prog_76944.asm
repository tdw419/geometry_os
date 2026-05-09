; DESCRIPTION: Creates a white rectangular region at (173, 221) spanning 57 by 30 pixels.
; PLAN: r0=173(x), r1=221(y), r2=57(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 221
LDI r2, 57
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
