; DESCRIPTION: Creates a red rectangular region at (158, 150) spanning 29 by 73 pixels.
; PLAN: r0=158(x), r1=150(y), r2=29(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 150
LDI r2, 29
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
