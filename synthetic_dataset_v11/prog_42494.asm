; DESCRIPTION: Creates a green rectangular region at (24, 114) spanning 61 by 108 pixels.
; PLAN: r0=24(x), r1=114(y), r2=61(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 114
LDI r2, 61
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
