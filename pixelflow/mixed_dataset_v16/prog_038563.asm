; DESCRIPTION: Creates a magenta rectangular region at (241, 0) spanning 16 by 20 pixels.
; PLAN: r0=241(x), r1=0(y), r2=16(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 0
LDI r2, 16
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
