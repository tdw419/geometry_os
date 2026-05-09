; DESCRIPTION: Creates a red rectangular region at (41, 32) spanning 98 by 12 pixels.
; PLAN: r0=41(x), r1=32(y), r2=98(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 32
LDI r2, 98
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
