; DESCRIPTION: Renders a blue box of size 59x27 starting at (191, 218).
; PLAN: r0=191(x), r1=218(y), r2=59(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 218
LDI r2, 59
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
