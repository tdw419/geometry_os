; DESCRIPTION: Creates a red rectangular region at (18, 230) spanning 34 by 15 pixels.
; PLAN: r0=18(x), r1=230(y), r2=34(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 230
LDI r2, 34
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
