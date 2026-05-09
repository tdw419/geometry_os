; DESCRIPTION: Renders a cyan box of size 41x115 starting at (412, 10).
; PLAN: r0=412(x), r1=10(y), r2=41(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 10
LDI r2, 41
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
