; DESCRIPTION: Renders a cyan box of size 41x99 starting at (463, 109).
; PLAN: r0=463(x), r1=109(y), r2=41(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 109
LDI r2, 41
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
