; DESCRIPTION: Creates a cyan rectangular region at (107, 62) spanning 28 by 62 pixels.
; PLAN: r0=107(x), r1=62(y), r2=28(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 62
LDI r2, 28
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
