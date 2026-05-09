; DESCRIPTION: Creates a blue rectangular region at (394, 49) spanning 115 by 115 pixels.
; PLAN: r0=394(x), r1=49(y), r2=115(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 49
LDI r2, 115
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
