; DESCRIPTION: Creates a green rectangular region at (150, 43) spanning 34 by 114 pixels.
; PLAN: r0=150(x), r1=43(y), r2=34(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 43
LDI r2, 34
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
