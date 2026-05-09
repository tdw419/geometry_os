; DESCRIPTION: Creates a white rectangular region at (10, 173) spanning 17 by 67 pixels.
; PLAN: r0=10(x), r1=173(y), r2=17(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 173
LDI r2, 17
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
