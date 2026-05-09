; DESCRIPTION: Creates a black rectangular region at (228, 25) spanning 100 by 74 pixels.
; PLAN: r0=228(x), r1=25(y), r2=100(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 25
LDI r2, 100
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
