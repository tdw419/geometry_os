; DESCRIPTION: Creates a red rectangular region at (181, 81) spanning 50 by 81 pixels.
; PLAN: r0=181(x), r1=81(y), r2=50(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 81
LDI r2, 50
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
