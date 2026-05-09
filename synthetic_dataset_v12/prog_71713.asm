; DESCRIPTION: Creates a red rectangular region at (55, 32) spanning 24 by 60 pixels.
; PLAN: r0=55(x), r1=32(y), r2=24(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 32
LDI r2, 24
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
