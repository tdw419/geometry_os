; DESCRIPTION: Creates a white rectangular region at (195, 82) spanning 63 by 88 pixels.
; PLAN: r0=195(x), r1=82(y), r2=63(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 82
LDI r2, 63
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
