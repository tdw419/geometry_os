; DESCRIPTION: Creates a cyan rectangular region at (31, 114) spanning 29 by 54 pixels.
; PLAN: r0=31(x), r1=114(y), r2=29(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 114
LDI r2, 29
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
