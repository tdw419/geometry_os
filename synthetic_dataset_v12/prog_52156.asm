; DESCRIPTION: Creates a red rectangular region at (20, 1) spanning 24 by 32 pixels.
; PLAN: r0=20(x), r1=1(y), r2=24(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 1
LDI r2, 24
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
