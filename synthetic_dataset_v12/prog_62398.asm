; DESCRIPTION: Creates a magenta rectangular region at (374, 167) spanning 89 by 45 pixels.
; PLAN: r0=374(x), r1=167(y), r2=89(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 167
LDI r2, 89
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
