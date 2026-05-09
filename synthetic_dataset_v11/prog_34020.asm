; DESCRIPTION: Creates a green rectangular region at (32, 114) spanning 32 by 83 pixels.
; PLAN: r0=32(x), r1=114(y), r2=32(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 114
LDI r2, 32
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
