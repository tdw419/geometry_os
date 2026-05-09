; DESCRIPTION: Creates a white rectangular region at (361, 67) spanning 45 by 25 pixels.
; PLAN: r0=361(x), r1=67(y), r2=45(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 67
LDI r2, 45
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
