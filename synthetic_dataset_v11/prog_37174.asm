; DESCRIPTION: Creates a red rectangular region at (108, 118) spanning 52 by 32 pixels.
; PLAN: r0=108(x), r1=118(y), r2=52(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 118
LDI r2, 52
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
