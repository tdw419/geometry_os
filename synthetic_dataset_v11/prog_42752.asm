; DESCRIPTION: Creates a orange rectangular region at (113, 226) spanning 91 by 18 pixels.
; PLAN: r0=113(x), r1=226(y), r2=91(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 226
LDI r2, 91
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
