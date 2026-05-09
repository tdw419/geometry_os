; DESCRIPTION: Creates a blue rectangular region at (375, 156) spanning 16 by 82 pixels.
; PLAN: r0=375(x), r1=156(y), r2=16(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 156
LDI r2, 16
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
