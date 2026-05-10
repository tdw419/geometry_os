; DESCRIPTION: Creates a magenta rectangular region at (322, 45) spanning 25 by 68 pixels.
; PLAN: r0=322(x), r1=45(y), r2=25(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 45
LDI r2, 25
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
