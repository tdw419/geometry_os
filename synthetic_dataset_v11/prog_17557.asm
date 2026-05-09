; DESCRIPTION: Creates a orange rectangular region at (28, 150) spanning 105 by 39 pixels.
; PLAN: r0=28(x), r1=150(y), r2=105(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 150
LDI r2, 105
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
