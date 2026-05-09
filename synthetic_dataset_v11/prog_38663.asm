; DESCRIPTION: Creates a orange rectangular region at (162, 151) spanning 19 by 24 pixels.
; PLAN: r0=162(x), r1=151(y), r2=19(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 151
LDI r2, 19
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
