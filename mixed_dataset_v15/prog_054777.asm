; DESCRIPTION: Creates a red rectangular region at (40, 88) spanning 50 by 32 pixels.
; PLAN: r0=40(x), r1=88(y), r2=50(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 88
LDI r2, 50
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
