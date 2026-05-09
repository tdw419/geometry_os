; DESCRIPTION: Creates a white rectangular region at (240, 64) spanning 67 by 10 pixels.
; PLAN: r0=240(x), r1=64(y), r2=67(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 64
LDI r2, 67
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
