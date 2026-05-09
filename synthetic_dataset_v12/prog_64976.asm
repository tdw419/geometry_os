; DESCRIPTION: Creates a red rectangular region at (84, 96) spanning 99 by 103 pixels.
; PLAN: r0=84(x), r1=96(y), r2=99(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 96
LDI r2, 99
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
