; DESCRIPTION: Creates a magenta rectangular region at (189, 204) spanning 11 by 36 pixels.
; PLAN: r0=189(x), r1=204(y), r2=11(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 204
LDI r2, 11
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
