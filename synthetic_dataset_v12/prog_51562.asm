; DESCRIPTION: Creates a blue rectangular region at (50, 50) spanning 90 by 62 pixels.
; PLAN: r0=50(x), r1=50(y), r2=90(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 50
LDI r2, 90
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
