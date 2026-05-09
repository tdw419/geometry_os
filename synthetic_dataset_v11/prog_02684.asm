; DESCRIPTION: Renders a blue box of size 98x80 starting at (60, 30).
; PLAN: r0=60(x), r1=30(y), r2=98(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 30
LDI r2, 98
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
