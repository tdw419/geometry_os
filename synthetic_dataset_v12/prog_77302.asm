; DESCRIPTION: Creates a cyan rectangular region at (469, 173) spanning 26 by 13 pixels.
; PLAN: r0=469(x), r1=173(y), r2=26(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 173
LDI r2, 26
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
