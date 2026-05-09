; DESCRIPTION: Creates a blue rectangular region at (35, 148) spanning 42 by 41 pixels.
; PLAN: r0=35(x), r1=148(y), r2=42(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 148
LDI r2, 42
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
