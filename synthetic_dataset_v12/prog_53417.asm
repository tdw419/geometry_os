; DESCRIPTION: Renders a cyan box of size 27x41 starting at (432, 93).
; PLAN: r0=432(x), r1=93(y), r2=27(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 93
LDI r2, 27
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
