; DESCRIPTION: Creates a magenta rectangular region at (192, 167) spanning 28 by 65 pixels.
; PLAN: r0=192(x), r1=167(y), r2=28(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 167
LDI r2, 28
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
