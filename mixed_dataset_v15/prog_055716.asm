; DESCRIPTION: Creates a orange rectangular region at (32, 195) spanning 35 by 32 pixels.
; PLAN: r0=32(x), r1=195(y), r2=35(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 195
LDI r2, 35
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
