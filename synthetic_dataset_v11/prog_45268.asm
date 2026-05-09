; DESCRIPTION: Creates a blue rectangular region at (2, 62) spanning 90 by 82 pixels.
; PLAN: r0=2(x), r1=62(y), r2=90(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 62
LDI r2, 90
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
