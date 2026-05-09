; DESCRIPTION: Creates a cyan rectangular region at (32, 183) spanning 18 by 15 pixels.
; PLAN: r0=32(x), r1=183(y), r2=18(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 183
LDI r2, 18
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
