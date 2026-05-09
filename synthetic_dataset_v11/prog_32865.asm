; DESCRIPTION: Creates a green rectangular region at (40, 101) spanning 120 by 83 pixels.
; PLAN: r0=40(x), r1=101(y), r2=120(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 101
LDI r2, 120
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
