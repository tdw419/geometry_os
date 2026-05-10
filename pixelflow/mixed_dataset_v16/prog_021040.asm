; DESCRIPTION: Creates a magenta rectangular region at (161, 128) spanning 109 by 95 pixels.
; PLAN: r0=161(x), r1=128(y), r2=109(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 128
LDI r2, 109
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
