; DESCRIPTION: Renders a blue box of size 80x23 starting at (100, 143).
; PLAN: r0=100(x), r1=143(y), r2=80(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 143
LDI r2, 80
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
