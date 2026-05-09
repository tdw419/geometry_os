; DESCRIPTION: Creates a yellow rectangular region at (125, 63) spanning 73 by 82 pixels.
; PLAN: r0=125(x), r1=63(y), r2=73(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 63
LDI r2, 73
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
