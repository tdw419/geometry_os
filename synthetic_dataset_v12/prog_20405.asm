; DESCRIPTION: Creates a magenta rectangular region at (121, 168) spanning 63 by 53 pixels.
; PLAN: r0=121(x), r1=168(y), r2=63(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 168
LDI r2, 63
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
