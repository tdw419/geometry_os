; DESCRIPTION: Creates a orange rectangular region at (200, 6) spanning 63 by 93 pixels.
; PLAN: r0=200(x), r1=6(y), r2=63(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 6
LDI r2, 63
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
