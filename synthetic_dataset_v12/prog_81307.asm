; DESCRIPTION: Creates a white rectangular region at (423, 67) spanning 73 by 45 pixels.
; PLAN: r0=423(x), r1=67(y), r2=73(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 67
LDI r2, 73
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
