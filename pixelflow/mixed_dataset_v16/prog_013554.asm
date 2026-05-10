; DESCRIPTION: Creates a cyan rectangular region at (189, 84) spanning 67 by 39 pixels.
; PLAN: r0=189(x), r1=84(y), r2=67(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 84
LDI r2, 67
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
