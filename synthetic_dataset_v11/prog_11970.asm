; DESCRIPTION: Creates a red rectangular region at (192, 8) spanning 14 by 52 pixels.
; PLAN: r0=192(x), r1=8(y), r2=14(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 8
LDI r2, 14
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
