; DESCRIPTION: Creates a magenta rectangular region at (135, 164) spanning 75 by 66 pixels.
; PLAN: r0=135(x), r1=164(y), r2=75(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 164
LDI r2, 75
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
