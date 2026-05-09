; DESCRIPTION: Creates a white rectangular region at (155, 42) spanning 67 by 70 pixels.
; PLAN: r0=155(x), r1=42(y), r2=67(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 42
LDI r2, 67
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
