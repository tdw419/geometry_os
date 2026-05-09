; DESCRIPTION: Renders a blue box of size 72x36 starting at (229, 205).
; PLAN: r0=229(x), r1=205(y), r2=72(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 205
LDI r2, 72
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
