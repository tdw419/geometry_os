; DESCRIPTION: Creates a green rectangular region at (77, 36) spanning 69 by 82 pixels.
; PLAN: r0=77(x), r1=36(y), r2=69(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 36
LDI r2, 69
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
