; DESCRIPTION: Creates a blue rectangular region at (394, 139) spanning 106 by 21 pixels.
; PLAN: r0=394(x), r1=139(y), r2=106(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 139
LDI r2, 106
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
