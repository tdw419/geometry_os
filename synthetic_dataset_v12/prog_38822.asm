; DESCRIPTION: Creates a cyan rectangular region at (29, 56) spanning 26 by 117 pixels.
; PLAN: r0=29(x), r1=56(y), r2=26(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 56
LDI r2, 26
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
