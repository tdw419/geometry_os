; DESCRIPTION: Creates a cyan rectangular region at (173, 64) spanning 46 by 25 pixels.
; PLAN: r0=173(x), r1=64(y), r2=46(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 64
LDI r2, 46
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
