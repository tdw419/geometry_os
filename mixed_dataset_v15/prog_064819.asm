; DESCRIPTION: Creates a green rectangular region at (265, 194) spanning 102 by 62 pixels.
; PLAN: r0=265(x), r1=194(y), r2=102(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 194
LDI r2, 102
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
