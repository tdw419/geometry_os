; DESCRIPTION: Creates a red rectangular region at (296, 95) spanning 39 by 101 pixels.
; PLAN: r0=296(x), r1=95(y), r2=39(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 95
LDI r2, 39
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
