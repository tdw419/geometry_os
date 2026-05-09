; DESCRIPTION: Creates a orange rectangular region at (42, 144) spanning 105 by 20 pixels.
; PLAN: r0=42(x), r1=144(y), r2=105(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 144
LDI r2, 105
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
