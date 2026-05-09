; DESCRIPTION: Creates a white rectangular region at (245, 53) spanning 48 by 67 pixels.
; PLAN: r0=245(x), r1=53(y), r2=48(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 53
LDI r2, 48
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
