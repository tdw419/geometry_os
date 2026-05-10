; DESCRIPTION: Creates a orange rectangular region at (27, 154) spanning 100 by 35 pixels.
; PLAN: r0=27(x), r1=154(y), r2=100(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 154
LDI r2, 100
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
