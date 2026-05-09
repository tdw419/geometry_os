; DESCRIPTION: Creates a orange rectangular region at (136, 58) spanning 59 by 107 pixels.
; PLAN: r0=136(x), r1=58(y), r2=59(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 58
LDI r2, 59
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
