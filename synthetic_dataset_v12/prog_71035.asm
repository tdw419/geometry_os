; DESCRIPTION: Creates a magenta rectangular region at (57, 80) spanning 95 by 68 pixels.
; PLAN: r0=57(x), r1=80(y), r2=95(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 80
LDI r2, 95
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
