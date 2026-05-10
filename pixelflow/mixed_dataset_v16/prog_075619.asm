; DESCRIPTION: Creates a red rectangular region at (12, 186) spanning 101 by 28 pixels.
; PLAN: r0=12(x), r1=186(y), r2=101(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 186
LDI r2, 101
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
