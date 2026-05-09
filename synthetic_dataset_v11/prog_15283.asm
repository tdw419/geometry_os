; DESCRIPTION: Creates a orange rectangular region at (20, 134) spanning 99 by 16 pixels.
; PLAN: r0=20(x), r1=134(y), r2=99(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 134
LDI r2, 99
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
