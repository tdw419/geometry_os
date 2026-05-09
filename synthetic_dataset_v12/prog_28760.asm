; DESCRIPTION: Creates a magenta rectangular region at (173, 121) spanning 117 by 60 pixels.
; PLAN: r0=173(x), r1=121(y), r2=117(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 121
LDI r2, 117
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
