; DESCRIPTION: Creates a magenta rectangular region at (204, 137) spanning 50 by 57 pixels.
; PLAN: r0=204(x), r1=137(y), r2=50(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 137
LDI r2, 50
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
