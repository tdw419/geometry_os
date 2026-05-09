; DESCRIPTION: Creates a red rectangular region at (64, 207) spanning 43 by 48 pixels.
; PLAN: r0=64(x), r1=207(y), r2=43(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 207
LDI r2, 43
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
