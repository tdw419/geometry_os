; DESCRIPTION: Creates a yellow rectangular region at (57, 41) spanning 42 by 24 pixels.
; PLAN: r0=57(x), r1=41(y), r2=42(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 41
LDI r2, 42
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
