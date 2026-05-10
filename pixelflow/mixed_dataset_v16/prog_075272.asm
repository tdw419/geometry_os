; DESCRIPTION: Creates a blue rectangular region at (375, 21) spanning 77 by 73 pixels.
; PLAN: r0=375(x), r1=21(y), r2=77(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 21
LDI r2, 77
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
