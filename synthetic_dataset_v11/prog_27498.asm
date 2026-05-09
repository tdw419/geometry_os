; DESCRIPTION: Creates a magenta rectangular region at (199, 138) spanning 55 by 111 pixels.
; PLAN: r0=199(x), r1=138(y), r2=55(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 138
LDI r2, 55
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
