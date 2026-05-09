; DESCRIPTION: Renders a blue box of size 87x26 starting at (59, 168).
; PLAN: r0=59(x), r1=168(y), r2=87(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 168
LDI r2, 87
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
