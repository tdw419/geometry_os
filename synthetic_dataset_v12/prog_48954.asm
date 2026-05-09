; DESCRIPTION: Creates a magenta rectangular region at (365, 16) spanning 92 by 66 pixels.
; PLAN: r0=365(x), r1=16(y), r2=92(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 16
LDI r2, 92
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
