; DESCRIPTION: Creates a orange rectangular region at (377, 64) spanning 23 by 86 pixels.
; PLAN: r0=377(x), r1=64(y), r2=23(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 64
LDI r2, 23
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
