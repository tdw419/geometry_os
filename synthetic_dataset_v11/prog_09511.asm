; DESCRIPTION: Renders a blue box of size 21x98 starting at (75, 50).
; PLAN: r0=75(x), r1=50(y), r2=21(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 50
LDI r2, 21
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
