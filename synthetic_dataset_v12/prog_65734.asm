; DESCRIPTION: Creates a red rectangular region at (427, 21) spanning 52 by 50 pixels.
; PLAN: r0=427(x), r1=21(y), r2=52(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 21
LDI r2, 52
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
