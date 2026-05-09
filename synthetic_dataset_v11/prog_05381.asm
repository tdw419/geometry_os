; DESCRIPTION: Creates a green rectangular region at (156, 108) spanning 60 by 114 pixels.
; PLAN: r0=156(x), r1=108(y), r2=60(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 108
LDI r2, 60
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
