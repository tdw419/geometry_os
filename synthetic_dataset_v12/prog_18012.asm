; DESCRIPTION: Creates a blue rectangular region at (85, 12) spanning 23 by 111 pixels.
; PLAN: r0=85(x), r1=12(y), r2=23(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 12
LDI r2, 23
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
