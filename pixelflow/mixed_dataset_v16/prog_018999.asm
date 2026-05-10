; DESCRIPTION: Creates a orange rectangular region at (160, 10) spanning 24 by 64 pixels.
; PLAN: r0=160(x), r1=10(y), r2=24(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 10
LDI r2, 24
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
