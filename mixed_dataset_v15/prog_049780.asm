; DESCRIPTION: Creates a magenta rectangular region at (206, 26) spanning 111 by 30 pixels.
; PLAN: r0=206(x), r1=26(y), r2=111(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 26
LDI r2, 111
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
