; DESCRIPTION: Creates a magenta rectangular region at (202, 90) spanning 68 by 34 pixels.
; PLAN: r0=202(x), r1=90(y), r2=68(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 90
LDI r2, 68
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
