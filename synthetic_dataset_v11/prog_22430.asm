; DESCRIPTION: Creates a red rectangular region at (49, 64) spanning 16 by 94 pixels.
; PLAN: r0=49(x), r1=64(y), r2=16(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 64
LDI r2, 16
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
