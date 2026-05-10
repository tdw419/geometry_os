; DESCRIPTION: Creates a black rectangular region at (85, 147) spanning 74 by 50 pixels.
; PLAN: r0=85(x), r1=147(y), r2=74(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 147
LDI r2, 74
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
