; DESCRIPTION: Creates a cyan rectangular region at (414, 114) spanning 54 by 83 pixels.
; PLAN: r0=414(x), r1=114(y), r2=54(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 114
LDI r2, 54
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
