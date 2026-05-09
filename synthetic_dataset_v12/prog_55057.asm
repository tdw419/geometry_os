; DESCRIPTION: Creates a orange rectangular region at (85, 144) spanning 40 by 48 pixels.
; PLAN: r0=85(x), r1=144(y), r2=40(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 144
LDI r2, 40
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
