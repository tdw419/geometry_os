; DESCRIPTION: Creates a white diamond shape using 4 lines meeting at the center.
; PLAN: r0=4(x), r1=4(y), r2=10(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 4
LDI r2, 10
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
