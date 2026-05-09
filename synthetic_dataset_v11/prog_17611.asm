; DESCRIPTION: Creates a cyan rectangular region at (123, 53) spanning 107 by 114 pixels.
; PLAN: r0=123(x), r1=53(y), r2=107(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 53
LDI r2, 107
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
