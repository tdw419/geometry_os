; DESCRIPTION: Creates a cyan rectangular region at (271, 11) spanning 88 by 13 pixels.
; PLAN: r0=271(x), r1=11(y), r2=88(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 11
LDI r2, 88
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
