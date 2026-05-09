; DESCRIPTION: Creates a green rectangular region at (157, 71) spanning 18 by 53 pixels.
; PLAN: r0=157(x), r1=71(y), r2=18(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 71
LDI r2, 18
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
