; DESCRIPTION: Creates a magenta rectangular region at (230, 206) spanning 115 by 49 pixels.
; PLAN: r0=230(x), r1=206(y), r2=115(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 206
LDI r2, 115
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
