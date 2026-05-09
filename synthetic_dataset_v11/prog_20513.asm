; DESCRIPTION: Creates a white rectangular region at (26, 25) spanning 61 by 63 pixels.
; PLAN: r0=26(x), r1=25(y), r2=61(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 25
LDI r2, 61
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
