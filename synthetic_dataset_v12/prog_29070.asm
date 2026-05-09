; DESCRIPTION: Creates a green rectangular region at (153, 142) spanning 39 by 12 pixels.
; PLAN: r0=153(x), r1=142(y), r2=39(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 142
LDI r2, 39
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
