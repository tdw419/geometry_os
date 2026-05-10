; DESCRIPTION: Creates a red rectangular region at (50, 110) spanning 49 by 21 pixels.
; PLAN: r0=50(x), r1=110(y), r2=49(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 110
LDI r2, 49
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
