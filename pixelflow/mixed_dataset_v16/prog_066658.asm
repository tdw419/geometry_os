; DESCRIPTION: Creates a red rectangular region at (8, 95) spanning 27 by 43 pixels.
; PLAN: r0=8(x), r1=95(y), r2=27(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 95
LDI r2, 27
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
