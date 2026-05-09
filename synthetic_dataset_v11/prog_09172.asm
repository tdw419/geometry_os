; DESCRIPTION: Creates a orange rectangular region at (156, 167) spanning 74 by 26 pixels.
; PLAN: r0=156(x), r1=167(y), r2=74(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 167
LDI r2, 74
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
