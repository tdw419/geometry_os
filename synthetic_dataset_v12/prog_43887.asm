; DESCRIPTION: Creates a red rectangular region at (296, 218) spanning 83 by 15 pixels.
; PLAN: r0=296(x), r1=218(y), r2=83(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 218
LDI r2, 83
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
