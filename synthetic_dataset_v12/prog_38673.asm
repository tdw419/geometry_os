; DESCRIPTION: Creates a magenta rectangular region at (32, 39) spanning 95 by 41 pixels.
; PLAN: r0=32(x), r1=39(y), r2=95(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 39
LDI r2, 95
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
