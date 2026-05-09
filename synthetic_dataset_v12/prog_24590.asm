; DESCRIPTION: Creates a cyan rectangular region at (354, 77) spanning 101 by 73 pixels.
; PLAN: r0=354(x), r1=77(y), r2=101(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 77
LDI r2, 101
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
