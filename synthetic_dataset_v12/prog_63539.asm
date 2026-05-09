; DESCRIPTION: Creates a red rectangular region at (365, 3) spanning 101 by 32 pixels.
; PLAN: r0=365(x), r1=3(y), r2=101(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 3
LDI r2, 101
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
