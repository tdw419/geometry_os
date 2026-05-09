; DESCRIPTION: Creates a orange rectangular region at (197, 156) spanning 73 by 53 pixels.
; PLAN: r0=197(x), r1=156(y), r2=73(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 156
LDI r2, 73
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
