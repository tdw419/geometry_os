; DESCRIPTION: Creates a cyan rectangular region at (203, 36) spanning 119 by 118 pixels.
; PLAN: r0=203(x), r1=36(y), r2=119(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 36
LDI r2, 119
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
