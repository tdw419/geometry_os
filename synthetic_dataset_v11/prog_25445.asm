; DESCRIPTION: Creates a magenta rectangular region at (186, 121) spanning 25 by 34 pixels.
; PLAN: r0=186(x), r1=121(y), r2=25(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 121
LDI r2, 25
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
