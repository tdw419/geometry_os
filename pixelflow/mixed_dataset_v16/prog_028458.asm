; DESCRIPTION: Creates a cyan rectangular region at (183, 43) spanning 100 by 106 pixels.
; PLAN: r0=183(x), r1=43(y), r2=100(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 43
LDI r2, 100
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
