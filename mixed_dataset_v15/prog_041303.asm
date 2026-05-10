; DESCRIPTION: Creates a blue rectangular region at (239, 139) spanning 102 by 117 pixels.
; PLAN: r0=239(x), r1=139(y), r2=102(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 139
LDI r2, 102
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
