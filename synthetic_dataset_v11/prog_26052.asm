; DESCRIPTION: Creates a cyan rectangular region at (17, 32) spanning 101 by 107 pixels.
; PLAN: r0=17(x), r1=32(y), r2=101(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 32
LDI r2, 101
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
