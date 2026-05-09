; DESCRIPTION: Creates a red rectangular region at (137, 13) spanning 30 by 54 pixels.
; PLAN: r0=137(x), r1=13(y), r2=30(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 13
LDI r2, 30
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
