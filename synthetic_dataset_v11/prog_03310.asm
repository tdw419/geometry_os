; DESCRIPTION: Creates a white rectangular region at (91, 156) spanning 37 by 32 pixels.
; PLAN: r0=91(x), r1=156(y), r2=37(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 156
LDI r2, 37
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
