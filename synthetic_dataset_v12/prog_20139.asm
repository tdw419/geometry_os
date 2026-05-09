; DESCRIPTION: Creates a yellow rectangular region at (63, 73) spanning 26 by 76 pixels.
; PLAN: r0=63(x), r1=73(y), r2=26(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 73
LDI r2, 26
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
