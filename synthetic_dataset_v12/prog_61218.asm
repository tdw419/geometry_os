; DESCRIPTION: Creates a white rectangular region at (50, 43) spanning 16 by 63 pixels.
; PLAN: r0=50(x), r1=43(y), r2=16(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 43
LDI r2, 16
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
