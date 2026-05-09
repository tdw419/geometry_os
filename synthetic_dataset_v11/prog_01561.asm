; DESCRIPTION: Creates a red rectangular region at (237, 81) spanning 15 by 114 pixels.
; PLAN: r0=237(x), r1=81(y), r2=15(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 81
LDI r2, 15
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
