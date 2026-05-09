; DESCRIPTION: Creates a blue rectangular region at (164, 65) spanning 15 by 30 pixels.
; PLAN: r0=164(x), r1=65(y), r2=15(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 65
LDI r2, 15
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
