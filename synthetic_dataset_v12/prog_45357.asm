; DESCRIPTION: Creates a orange rectangular region at (188, 30) spanning 21 by 68 pixels.
; PLAN: r0=188(x), r1=30(y), r2=21(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 30
LDI r2, 21
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
