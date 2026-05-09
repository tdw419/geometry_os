; DESCRIPTION: Creates a white rectangular region at (206, 73) spanning 32 by 101 pixels.
; PLAN: r0=206(x), r1=73(y), r2=32(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 73
LDI r2, 32
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
