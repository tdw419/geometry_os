; DESCRIPTION: Creates a orange rectangular region at (166, 93) spanning 19 by 68 pixels.
; PLAN: r0=166(x), r1=93(y), r2=19(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 93
LDI r2, 19
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
