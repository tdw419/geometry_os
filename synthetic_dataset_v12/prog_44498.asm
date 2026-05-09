; DESCRIPTION: Renders a cyan box of size 24x62 starting at (30, 41).
; PLAN: r0=30(x), r1=41(y), r2=24(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 41
LDI r2, 24
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
