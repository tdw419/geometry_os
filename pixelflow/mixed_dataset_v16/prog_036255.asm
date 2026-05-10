; DESCRIPTION: Creates a orange rectangular region at (375, 177) spanning 75 by 63 pixels.
; PLAN: r0=375(x), r1=177(y), r2=75(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 177
LDI r2, 75
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
