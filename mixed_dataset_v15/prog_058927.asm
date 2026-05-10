; DESCRIPTION: Creates a blue rectangular region at (41, 168) spanning 68 by 45 pixels.
; PLAN: r0=41(x), r1=168(y), r2=68(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 168
LDI r2, 68
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
