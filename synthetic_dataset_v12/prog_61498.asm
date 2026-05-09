; DESCRIPTION: Creates a magenta rectangular region at (121, 96) spanning 117 by 16 pixels.
; PLAN: r0=121(x), r1=96(y), r2=117(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 96
LDI r2, 117
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
