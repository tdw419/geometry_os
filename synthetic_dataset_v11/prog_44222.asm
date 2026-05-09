; DESCRIPTION: Renders a blue box of size 50x85 starting at (30, 15).
; PLAN: r0=30(x), r1=15(y), r2=50(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 15
LDI r2, 50
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
