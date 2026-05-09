; DESCRIPTION: Creates a white rectangular region at (327, 63) spanning 69 by 31 pixels.
; PLAN: r0=327(x), r1=63(y), r2=69(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 63
LDI r2, 69
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
