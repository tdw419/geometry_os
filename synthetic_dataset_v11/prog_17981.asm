; DESCRIPTION: Creates a cyan rectangular region at (6, 203) spanning 19 by 22 pixels.
; PLAN: r0=6(x), r1=203(y), r2=19(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 203
LDI r2, 19
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
