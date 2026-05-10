; DESCRIPTION: Creates a red rectangular region at (358, 153) spanning 84 by 30 pixels.
; PLAN: r0=358(x), r1=153(y), r2=84(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 153
LDI r2, 84
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
