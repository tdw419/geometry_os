; DESCRIPTION: Creates a cyan rectangular region at (227, 77) spanning 82 by 67 pixels.
; PLAN: r0=227(x), r1=77(y), r2=82(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 77
LDI r2, 82
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
