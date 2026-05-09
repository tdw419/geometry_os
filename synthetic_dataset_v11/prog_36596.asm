; DESCRIPTION: Creates a red rectangular region at (41, 56) spanning 42 by 77 pixels.
; PLAN: r0=41(x), r1=56(y), r2=42(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 56
LDI r2, 42
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
