; DESCRIPTION: Creates a magenta rectangular region at (121, 44) spanning 10 by 109 pixels.
; PLAN: r0=121(x), r1=44(y), r2=10(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 44
LDI r2, 10
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
