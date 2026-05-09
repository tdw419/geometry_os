; DESCRIPTION: Creates a cyan rectangular region at (354, 34) spanning 90 by 114 pixels.
; PLAN: r0=354(x), r1=34(y), r2=90(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 34
LDI r2, 90
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
