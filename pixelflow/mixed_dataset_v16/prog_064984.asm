; DESCRIPTION: Creates a cyan rectangular region at (377, 172) spanning 42 by 41 pixels.
; PLAN: r0=377(x), r1=172(y), r2=42(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 172
LDI r2, 42
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
