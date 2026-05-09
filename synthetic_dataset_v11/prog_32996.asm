; DESCRIPTION: Creates a red rectangular region at (105, 64) spanning 98 by 49 pixels.
; PLAN: r0=105(x), r1=64(y), r2=98(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 64
LDI r2, 98
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
