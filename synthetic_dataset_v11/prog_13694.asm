; DESCRIPTION: Creates a cyan rectangular region at (17, 98) spanning 32 by 46 pixels.
; PLAN: r0=17(x), r1=98(y), r2=32(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 98
LDI r2, 32
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
