; DESCRIPTION: Renders a blue box of size 59x80 starting at (23, 98).
; PLAN: r0=23(x), r1=98(y), r2=59(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 98
LDI r2, 59
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
