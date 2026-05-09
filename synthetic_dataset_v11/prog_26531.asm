; DESCRIPTION: Creates a red rectangular region at (72, 94) spanning 102 by 73 pixels.
; PLAN: r0=72(x), r1=94(y), r2=102(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 94
LDI r2, 102
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
