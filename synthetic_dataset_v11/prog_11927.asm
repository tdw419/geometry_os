; DESCRIPTION: Creates a white rectangular region at (126, 166) spanning 100 by 63 pixels.
; PLAN: r0=126(x), r1=166(y), r2=100(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 166
LDI r2, 100
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
