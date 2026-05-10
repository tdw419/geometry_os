; DESCRIPTION: Creates a orange rectangular region at (167, 84) spanning 94 by 59 pixels.
; PLAN: r0=167(x), r1=84(y), r2=94(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 84
LDI r2, 94
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
