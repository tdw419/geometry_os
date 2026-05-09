; DESCRIPTION: Creates a orange rectangular region at (70, 122) spanning 63 by 82 pixels.
; PLAN: r0=70(x), r1=122(y), r2=63(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 122
LDI r2, 63
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
