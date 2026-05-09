; DESCRIPTION: Creates a green rectangular region at (156, 127) spanning 43 by 19 pixels.
; PLAN: r0=156(x), r1=127(y), r2=43(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 127
LDI r2, 43
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
