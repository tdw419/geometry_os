; DESCRIPTION: Renders a magenta box of size 101x41 starting at (259, 89).
; PLAN: r0=259(x), r1=89(y), r2=101(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 89
LDI r2, 101
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
