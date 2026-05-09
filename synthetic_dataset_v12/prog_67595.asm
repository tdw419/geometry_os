; DESCRIPTION: Creates a orange rectangular region at (58, 59) spanning 113 by 52 pixels.
; PLAN: r0=58(x), r1=59(y), r2=113(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 59
LDI r2, 113
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
