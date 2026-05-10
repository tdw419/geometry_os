; DESCRIPTION: Creates a green rectangular region at (1, 114) spanning 83 by 90 pixels.
; PLAN: r0=1(x), r1=114(y), r2=83(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 114
LDI r2, 83
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
