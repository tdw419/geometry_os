; DESCRIPTION: Creates a magenta rectangular region at (45, 73) spanning 103 by 39 pixels.
; PLAN: r0=45(x), r1=73(y), r2=103(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 73
LDI r2, 103
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
