; DESCRIPTION: Creates a red rectangular region at (147, 159) spanning 62 by 81 pixels.
; PLAN: r0=147(x), r1=159(y), r2=62(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 159
LDI r2, 62
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
