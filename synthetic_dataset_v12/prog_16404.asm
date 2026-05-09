; DESCRIPTION: Creates a red rectangular region at (20, 26) spanning 11 by 12 pixels.
; PLAN: r0=20(x), r1=26(y), r2=11(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 26
LDI r2, 11
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
