; DESCRIPTION: Creates a orange rectangular region at (33, 128) spanning 93 by 112 pixels.
; PLAN: r0=33(x), r1=128(y), r2=93(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 128
LDI r2, 93
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
