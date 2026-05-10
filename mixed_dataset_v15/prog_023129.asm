; DESCRIPTION: Creates a orange rectangular region at (174, 16) spanning 105 by 68 pixels.
; PLAN: r0=174(x), r1=16(y), r2=105(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 16
LDI r2, 105
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
