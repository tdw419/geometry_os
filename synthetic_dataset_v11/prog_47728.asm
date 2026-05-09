; DESCRIPTION: Creates a blue rectangular region at (50, 22) spanning 115 by 53 pixels.
; PLAN: r0=50(x), r1=22(y), r2=115(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 22
LDI r2, 115
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
