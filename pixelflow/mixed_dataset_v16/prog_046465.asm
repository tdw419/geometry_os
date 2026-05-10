; DESCRIPTION: Renders a blue box of size 41x73 starting at (439, 70).
; PLAN: r0=439(x), r1=70(y), r2=41(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 70
LDI r2, 41
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
