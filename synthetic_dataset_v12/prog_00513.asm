; DESCRIPTION: Creates a red rectangular region at (2, 195) spanning 78 by 18 pixels.
; PLAN: r0=2(x), r1=195(y), r2=78(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 195
LDI r2, 78
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
