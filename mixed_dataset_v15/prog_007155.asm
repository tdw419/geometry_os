; DESCRIPTION: Creates a white rectangular region at (66, 87) spanning 83 by 67 pixels.
; PLAN: r0=66(x), r1=87(y), r2=83(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 87
LDI r2, 83
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
