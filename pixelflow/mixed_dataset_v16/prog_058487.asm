; DESCRIPTION: Creates a magenta rectangular region at (170, 16) spanning 92 by 95 pixels.
; PLAN: r0=170(x), r1=16(y), r2=92(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 16
LDI r2, 92
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
