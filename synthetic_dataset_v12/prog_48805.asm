; DESCRIPTION: Creates a cyan rectangular region at (266, 22) spanning 21 by 67 pixels.
; PLAN: r0=266(x), r1=22(y), r2=21(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 22
LDI r2, 21
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
