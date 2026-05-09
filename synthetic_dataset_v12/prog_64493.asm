; DESCRIPTION: Creates a magenta rectangular region at (39, 116) spanning 98 by 16 pixels.
; PLAN: r0=39(x), r1=116(y), r2=98(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 116
LDI r2, 98
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
