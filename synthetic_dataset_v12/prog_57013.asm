; DESCRIPTION: Creates a cyan rectangular region at (287, 35) spanning 67 by 37 pixels.
; PLAN: r0=287(x), r1=35(y), r2=67(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 35
LDI r2, 67
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
