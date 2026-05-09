; DESCRIPTION: Creates a cyan rectangular region at (151, 219) spanning 116 by 37 pixels.
; PLAN: r0=151(x), r1=219(y), r2=116(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 219
LDI r2, 116
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
