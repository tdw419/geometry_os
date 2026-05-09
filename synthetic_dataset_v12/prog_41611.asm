; DESCRIPTION: Creates a blue rectangular region at (53, 121) spanning 91 by 54 pixels.
; PLAN: r0=53(x), r1=121(y), r2=91(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 121
LDI r2, 91
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
