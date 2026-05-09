; DESCRIPTION: Creates a red rectangular region at (181, 71) spanning 80 by 26 pixels.
; PLAN: r0=181(x), r1=71(y), r2=80(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 71
LDI r2, 80
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
