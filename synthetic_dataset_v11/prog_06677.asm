; DESCRIPTION: Renders a cyan box of size 95x55 starting at (123, 41).
; PLAN: r0=123(x), r1=41(y), r2=95(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 41
LDI r2, 95
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
