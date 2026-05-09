; DESCRIPTION: Creates a red rectangular region at (204, 132) spanning 15 by 61 pixels.
; PLAN: r0=204(x), r1=132(y), r2=15(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 132
LDI r2, 15
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
