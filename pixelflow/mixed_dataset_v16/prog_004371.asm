; DESCRIPTION: Creates a magenta rectangular region at (365, 194) spanning 96 by 34 pixels.
; PLAN: r0=365(x), r1=194(y), r2=96(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 194
LDI r2, 96
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
