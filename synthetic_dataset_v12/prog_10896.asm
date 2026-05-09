; DESCRIPTION: Creates a green rectangular region at (189, 78) spanning 50 by 116 pixels.
; PLAN: r0=189(x), r1=78(y), r2=50(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 78
LDI r2, 50
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
