; DESCRIPTION: Creates a magenta rectangular region at (260, 3) spanning 14 by 41 pixels.
; PLAN: r0=260(x), r1=3(y), r2=14(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 3
LDI r2, 14
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
