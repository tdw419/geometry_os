; DESCRIPTION: Creates a yellow rectangular region at (301, 167) spanning 109 by 60 pixels.
; PLAN: r0=301(x), r1=167(y), r2=109(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 167
LDI r2, 109
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
