; DESCRIPTION: Creates a white rectangular region at (87, 210) spanning 63 by 14 pixels.
; PLAN: r0=87(x), r1=210(y), r2=63(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 210
LDI r2, 63
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
