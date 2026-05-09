; DESCRIPTION: Creates a orange rectangular region at (91, 44) spanning 12 by 67 pixels.
; PLAN: r0=91(x), r1=44(y), r2=12(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 44
LDI r2, 12
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
