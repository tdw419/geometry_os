; DESCRIPTION: Renders a cyan box of size 16x43 starting at (41, 64).
; PLAN: r0=41(x), r1=64(y), r2=16(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 64
LDI r2, 16
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
