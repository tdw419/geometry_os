; DESCRIPTION: Creates a cyan rectangular region at (18, 43) spanning 63 by 102 pixels.
; PLAN: r0=18(x), r1=43(y), r2=63(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 43
LDI r2, 63
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
