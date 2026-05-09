; DESCRIPTION: Creates a orange rectangular region at (287, 21) spanning 86 by 67 pixels.
; PLAN: r0=287(x), r1=21(y), r2=86(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 21
LDI r2, 86
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
