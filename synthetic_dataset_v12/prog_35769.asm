; DESCRIPTION: Creates a magenta rectangular region at (434, 31) spanning 19 by 98 pixels.
; PLAN: r0=434(x), r1=31(y), r2=19(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 31
LDI r2, 19
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
