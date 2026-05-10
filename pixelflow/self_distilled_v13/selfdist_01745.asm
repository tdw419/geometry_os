; DESCRIPTION: Creates a blue diamond shape using 4 lines meeting at the center.
; PLAN: r0=42(x), r1=4(y), r2=40(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 4
LDI r2, 40
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
