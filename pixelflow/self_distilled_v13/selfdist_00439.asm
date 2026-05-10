; DESCRIPTION: Renders a orange rectangular region spanning 35 by 13 at (128, 28).
; PLAN: r0=128(x), r1=28(y), r2=35(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 28
LDI r2, 35
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
