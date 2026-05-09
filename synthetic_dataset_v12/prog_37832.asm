; DESCRIPTION: Creates a magenta rectangular region at (29, 174) spanning 111 by 36 pixels.
; PLAN: r0=29(x), r1=174(y), r2=111(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 174
LDI r2, 111
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
