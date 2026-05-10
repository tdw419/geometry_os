; DESCRIPTION: Creates a magenta rectangular region at (187, 34) spanning 57 by 36 pixels.
; PLAN: r0=187(x), r1=34(y), r2=57(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 34
LDI r2, 57
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
