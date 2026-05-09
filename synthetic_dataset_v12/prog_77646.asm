; DESCRIPTION: Creates a white rectangular region at (315, 21) spanning 67 by 74 pixels.
; PLAN: r0=315(x), r1=21(y), r2=67(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 21
LDI r2, 67
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
