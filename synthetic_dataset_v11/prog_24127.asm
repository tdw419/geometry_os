; DESCRIPTION: Creates a magenta rectangular region at (209, 174) spanning 35 by 32 pixels.
; PLAN: r0=209(x), r1=174(y), r2=35(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 174
LDI r2, 35
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
