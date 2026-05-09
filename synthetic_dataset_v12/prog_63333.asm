; DESCRIPTION: Creates a blue rectangular region at (425, 43) spanning 17 by 93 pixels.
; PLAN: r0=425(x), r1=43(y), r2=17(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 43
LDI r2, 17
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
