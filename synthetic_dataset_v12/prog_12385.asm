; DESCRIPTION: Creates a magenta rectangular region at (275, 58) spanning 41 by 25 pixels.
; PLAN: r0=275(x), r1=58(y), r2=41(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 58
LDI r2, 41
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
