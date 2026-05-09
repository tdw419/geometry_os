; DESCRIPTION: Creates a magenta rectangular region at (277, 121) spanning 97 by 93 pixels.
; PLAN: r0=277(x), r1=121(y), r2=97(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 121
LDI r2, 97
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
