; DESCRIPTION: Creates a magenta rectangular region at (225, 82) spanning 96 by 39 pixels.
; PLAN: r0=225(x), r1=82(y), r2=96(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 82
LDI r2, 96
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
