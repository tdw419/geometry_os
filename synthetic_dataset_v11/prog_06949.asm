; DESCRIPTION: Creates a orange rectangular region at (53, 112) spanning 64 by 30 pixels.
; PLAN: r0=53(x), r1=112(y), r2=64(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 112
LDI r2, 64
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
