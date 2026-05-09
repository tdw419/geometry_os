; DESCRIPTION: Creates a yellow rectangular region at (244, 46) spanning 27 by 53 pixels.
; PLAN: r0=244(x), r1=46(y), r2=27(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 46
LDI r2, 27
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
