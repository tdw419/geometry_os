; DESCRIPTION: Creates a blue rectangular region at (76, 82) spanning 75 by 24 pixels.
; PLAN: r0=76(x), r1=82(y), r2=75(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 82
LDI r2, 75
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
