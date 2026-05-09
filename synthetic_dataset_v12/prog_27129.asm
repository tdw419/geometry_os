; DESCRIPTION: Creates a blue rectangular region at (375, 50) spanning 26 by 31 pixels.
; PLAN: r0=375(x), r1=50(y), r2=26(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 50
LDI r2, 26
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
