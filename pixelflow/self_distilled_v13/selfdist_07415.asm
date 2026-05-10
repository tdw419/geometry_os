; DESCRIPTION: Creates a cyan diamond shape using 4 lines meeting at the center.
; PLAN: r0=42(x), r1=4(y), r2=41(width), r3=4(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 4
LDI r2, 41
LDI r3, 4
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
