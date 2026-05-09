; DESCRIPTION: Creates a green rectangular region at (309, 82) spanning 85 by 112 pixels.
; PLAN: r0=309(x), r1=82(y), r2=85(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 82
LDI r2, 85
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
