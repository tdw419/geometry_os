; DESCRIPTION: Creates a orange rectangular region at (32, 99) spanning 18 by 86 pixels.
; PLAN: r0=32(x), r1=99(y), r2=18(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 99
LDI r2, 18
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
