; DESCRIPTION: Creates a white rectangular region at (156, 202) spanning 84 by 29 pixels.
; PLAN: r0=156(x), r1=202(y), r2=84(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 202
LDI r2, 84
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
