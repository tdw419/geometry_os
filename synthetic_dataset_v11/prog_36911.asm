; DESCRIPTION: Creates a orange rectangular region at (2, 127) spanning 48 by 28 pixels.
; PLAN: r0=2(x), r1=127(y), r2=48(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 127
LDI r2, 48
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
