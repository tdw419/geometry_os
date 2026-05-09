; DESCRIPTION: Creates a black rectangular region at (279, 9) spanning 85 by 74 pixels.
; PLAN: r0=279(x), r1=9(y), r2=85(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 9
LDI r2, 85
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
