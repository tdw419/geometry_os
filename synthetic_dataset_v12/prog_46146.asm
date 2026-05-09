; DESCRIPTION: Creates a green rectangular region at (183, 82) spanning 109 by 99 pixels.
; PLAN: r0=183(x), r1=82(y), r2=109(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 82
LDI r2, 109
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
