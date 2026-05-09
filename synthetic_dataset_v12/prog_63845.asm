; DESCRIPTION: Creates a red rectangular region at (135, 9) spanning 34 by 26 pixels.
; PLAN: r0=135(x), r1=9(y), r2=34(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 9
LDI r2, 34
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
