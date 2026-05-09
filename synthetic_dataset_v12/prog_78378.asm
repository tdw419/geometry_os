; DESCRIPTION: Creates a cyan rectangular region at (137, 72) spanning 76 by 107 pixels.
; PLAN: r0=137(x), r1=72(y), r2=76(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 72
LDI r2, 76
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
