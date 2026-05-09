; DESCRIPTION: Creates a green rectangular region at (154, 119) spanning 71 by 53 pixels.
; PLAN: r0=154(x), r1=119(y), r2=71(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 119
LDI r2, 71
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
