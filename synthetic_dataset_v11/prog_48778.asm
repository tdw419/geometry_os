; DESCRIPTION: Renders a blue box of size 25x107 starting at (167, 50).
; PLAN: r0=167(x), r1=50(y), r2=25(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 50
LDI r2, 25
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
