; DESCRIPTION: Creates a orange rectangular region at (198, 156) spanning 60 by 67 pixels.
; PLAN: r0=198(x), r1=156(y), r2=60(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 156
LDI r2, 60
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
