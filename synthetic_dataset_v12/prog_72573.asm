; DESCRIPTION: Creates a magenta rectangular region at (275, 106) spanning 25 by 109 pixels.
; PLAN: r0=275(x), r1=106(y), r2=25(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 106
LDI r2, 25
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
