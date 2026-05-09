; DESCRIPTION: Renders a blue box of size 85x12 starting at (12, 220).
; PLAN: r0=12(x), r1=220(y), r2=85(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 220
LDI r2, 85
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
