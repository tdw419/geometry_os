; DESCRIPTION: Creates a orange rectangular region at (226, 56) spanning 37 by 27 pixels.
; PLAN: r0=226(x), r1=56(y), r2=37(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 56
LDI r2, 37
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
