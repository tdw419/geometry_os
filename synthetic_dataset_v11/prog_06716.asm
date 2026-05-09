; DESCRIPTION: Creates a orange rectangular region at (160, 132) spanning 68 by 109 pixels.
; PLAN: r0=160(x), r1=132(y), r2=68(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 132
LDI r2, 68
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
