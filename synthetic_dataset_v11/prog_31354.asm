; DESCRIPTION: Renders a magenta box of size 40x41 starting at (60, 1).
; PLAN: r0=60(x), r1=1(y), r2=40(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 1
LDI r2, 40
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
