; DESCRIPTION: Creates a orange rectangular region at (353, 103) spanning 76 by 68 pixels.
; PLAN: r0=353(x), r1=103(y), r2=76(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 103
LDI r2, 76
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
