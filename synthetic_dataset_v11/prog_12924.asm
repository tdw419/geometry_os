; DESCRIPTION: Creates a red rectangular region at (181, 167) spanning 59 by 56 pixels.
; PLAN: r0=181(x), r1=167(y), r2=59(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 167
LDI r2, 59
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
