; DESCRIPTION: Creates a red rectangular region at (105, 36) spanning 23 by 115 pixels.
; PLAN: r0=105(x), r1=36(y), r2=23(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 36
LDI r2, 23
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
