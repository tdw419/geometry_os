; DESCRIPTION: Renders a magenta box of size 29x41 starting at (95, 197).
; PLAN: r0=95(x), r1=197(y), r2=29(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 197
LDI r2, 29
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
