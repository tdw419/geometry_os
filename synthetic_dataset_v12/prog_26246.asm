; DESCRIPTION: Creates a red rectangular region at (64, 114) spanning 58 by 84 pixels.
; PLAN: r0=64(x), r1=114(y), r2=58(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 114
LDI r2, 58
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
