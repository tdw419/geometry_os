; DESCRIPTION: Creates a green rectangular region at (159, 55) spanning 98 by 30 pixels.
; PLAN: r0=159(x), r1=55(y), r2=98(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 55
LDI r2, 98
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
