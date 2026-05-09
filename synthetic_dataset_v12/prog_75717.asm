; DESCRIPTION: Creates a cyan rectangular region at (219, 4) spanning 17 by 11 pixels.
; PLAN: r0=219(x), r1=4(y), r2=17(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 4
LDI r2, 17
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
