; DESCRIPTION: Creates a white rectangular region at (42, 73) spanning 63 by 41 pixels.
; PLAN: r0=42(x), r1=73(y), r2=63(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 73
LDI r2, 63
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
