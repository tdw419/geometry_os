; DESCRIPTION: Creates a orange rectangular region at (19, 58) spanning 59 by 113 pixels.
; PLAN: r0=19(x), r1=58(y), r2=59(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 58
LDI r2, 59
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
