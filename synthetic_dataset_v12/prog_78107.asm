; DESCRIPTION: Creates a cyan rectangular region at (1, 10) spanning 102 by 114 pixels.
; PLAN: r0=1(x), r1=10(y), r2=102(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 10
LDI r2, 102
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
